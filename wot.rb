#!/usr/bin/env ruby

# Name:         wot (What's On TV)
# Version:      0.1.4
# Release:      1
# License:      Open Source
# Group:        System
# Source:       N/A
# URL:          http://lateralblast.com.au/
# Distribution: UNIX
# Vendor:       Lateral Blast
# Packager:     Richard Spindler <richard@lateralblast.com.au>
# Description:  Ruby script to process TV guide

# Load gems

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'getopt/std'
require 'terminal-table'
require 'mechanize'

# Set up some defaults

$script=$0
location="melbourne"
time_search=""
channel_search=""
$options="c:a:l:s:hnrCLNV"

def print_usage
  puts ""
  puts "Usage: "+$script+" -["+$options+"]"
  puts ""
  puts "-h: Display usage"
  puts "-c: Channel [TEN,ABC1,..]"
  puts "-a: Time [8,8.00,8:30,..]"
  puts "-l: Location"
  puts "-C: List channels"
  puts "-L: List locations"
  puts "-n: What's on TV now (to the current hour)"
  puts "-N: What's on TV next (to the next hour"
  puts "-s: Search on subject (eg News)"
  puts "-r: Show only staff picks"
  puts ""
  exit
end

def print_version()
  file_array=IO.readlines $0
  version=file_array.grep(/^# Version/)[0].split(":")[1].gsub(/^\s+/,'').chomp
  packager=file_array.grep(/^# Packager/)[0].split(":")[1].gsub(/^\s+/,'').chomp
  name=file_array.grep(/^# Name/)[0].split(":")[1].gsub(/^\s+/,'').chomp
  puts name+" v. "+version+" "+packager
end

def list_channels(location)
  base_url="http://www.yourtv.com.au/guide/"
  full_url=base_url+location+"/"
  puts "Channels:"
  puts "--------"
  doc = Nokogiri::HTML(open(base_url))
  doc.css('div.venue-name img').each do |node|
    channel_name=node[:title]
    channel_name=channel_name.gsub(/\s+/,'')
    puts channel_name
  end
  return
end

def list_locations(location)
  base_url="http://www.yourtv.com.au/guide/"
  full_url=base_url+location+"/"
  puts "Locations:"
  puts "---------"
  doc = Nokogiri::HTML(open(base_url))
  doc.css('li a').each do |node|
    if node.to_s.match(/ TV Guide/)
      location_name=node.text.split(/ /)[0]
      puts location_name
    end
  end
  return
end

def process_entry(table,prog_info,info,channel,time,content_search,staff_pick,staff_search)
  if content_search
    if content_search.match(/[A-z|0-9]/)
      if prog_info.match(/#{content_search}/)
        if staff_search == 1
          if staff_pick == "Yes"
            row=[info,channel,time,staff_pick]
            table.add_row(row)
          end
        else
          row=[info,channel,time,staff_pick]
          table.add_row(row)
        end
      end
    end
  else
    if staff_search == 1
      if staff_pick == "Yes"
        row=[info,channel,time,staff_pick]
        table.add_row(row)
      end
    else
      row=[info,channel,time,staff_pick]
      table.add_row(row)
    end
  end
  return(table)
end

def search_tv_page(channel_search,time_search,content_search,location,staff_search,date)
  rows=[]
  base_url="http://www.yourtv.com.au/guide/"
  full_url=base_url+location+"/"
  # Split out am/pm from search string so we can cover for 6pm and 6:30pm
  if time_search.match(/[0-9]/) and time_search.match(/am|pm/)
    if time_search.match(/am/)
      meridian="am"
      time_search=time_search.gsub(/am/,'')
    else
      meridian="pm"
      time_search=time_search.gsub(/pm/,'')
    end
  end
  # Start with Mechanize so we can follow links and don't need to set cookies
  agent=Mechanize.new
  page=agent.get(base_url)
  page=agent.page.link_with(:text => 'Rest of today').click
  page=page.content
  # Hand over to Nokogiri for processing
  doc=Nokogiri::HTML(page)
  uc_location=location.capitalize
  search_info="#{channel_search} #{uc_location} #{time_search} #{meridian} #{content_search} (#{date})"
  search_info=search_info.gsub(/\s+/,' ')
  table=Terminal::Table.new :title => "TV Programme: #{search_info}", :headings => ['Program','Channel','Time','Staff Pick']
  doc.css('div.pname').each do |node|
    if node.to_s.match(/Staff Pick/)
      staff_pick="Yes"
    else
      staff_pick=""
    end
    prog_info=node.css('a')[0]["title"]
    (info,time)=prog_info.split(/ at /)
    if info.match(/NITV on/)
      (prefix,info,channel)=info.split(/ on /)
      info=prefix+" on "+info
    else
      (info,channel)=info.split(/ on /)
    end
    # Handle Five in the time string for Seven and Nine 5pm news
    # in case you watch this commercial garbage which has half the news in twice the time
    if time.match(/Five/)
      (time,channel)=time.split(/ on /)
      time="5pm"
    end
    if channel
      channel=channel.gsub(/\s+/,'')
      if channel_search.match(/[A-z]/)
        if channel.match(/#{channel_search}/) or channel_search.match(/ALL/)
          if time_search.match(/[0-9]/)
            if meridian.match(/am|pm/)
              if prog_info.match(time_search) and prog_info.match(meridian)
                table=process_entry(table,prog_info,info,channel,time,content_search,staff_pick,staff_search)
              end
            else
              if prog_info.match(time_search)
                table=process_entry(table,prog_info,info,channel,time,content_search,staff_pick,staff_search)
              end
            end
          else
            table=process_entry(table,prog_info,info,channel,time,content_search,staff_pick,staff_search)
          end
        end
      else
        if time_search.match(/[0-9]/)
          if meridian.match(/am|pm/)
            if prog_info.match(time_search) and prog_info.match(meridian)
              table=process_entry(table,prog_info,info,channel,time,content_search,staff_pick,staff_search)
            end
          else
            if prog_info.match(time_search)
              table=process_entry(table,prog_info,info,channel,time,content_search,staff_pick,staff_search)
            end
          end
        else
          table=process_entry(table,prog_info,info,channel,time,content_search,staff_pick,staff_search)
        end
      end
    end
  end
  puts table
  return
end

def handle_channel(channel_search)
  channel_search=channel_search.gsub(/\s+/,'')
  case channel_search
  when /^7$/
    channel_search="Seven"
  when /^9$/
    channel_search="Nine"
  when /^2$/
    channel_search="ABC2"
  when /^1$/
    channel_search="ABC1"
  when /SBS1|SBS 1/
    channel_search="SBSONE"
  when /^0$/
    channel_search="SBSONE"
  when /SBS2|SBS 2/
    channel_search="SBS2"
  when /^4$/
    channel_search="ABC4"
  when /10$/
    channel_search="TEN"
  when /11$/
    channel_search="ELEVEN"
  when /24$/
    channel_search="ABCNews24"
  end
  if !channel_search.downcase.match(/news/)
    channel_search=channel_search.downcase
    if !channel_search.match(/mate/)
      if channel_search.match(/seven|nine/)
        channel_search=channel_search.capitalize
      else
        channel_search=channel_search.upcase
      end
    end
  else
    channel_search="ABCNews24"
  end
  return(channel_search)
end

# Get command line arguments
# Print help if given none

if !ARGV[0]
  print_usage()
end

begin
  opt=Getopt::Std.getopts($options)
rescue
  print_usage()
end

if opt["V"]
  print_version
  exit
end

# Handle getting what is on in the current or next hour

if opt["n"] or opt["N"]
  time=Time.new
  hour=time.hour
  if hour > 11
    hour=hour-12
    suffix="pm"
  else
    suffix="am"
  end
  if hour == 0
    hour=12
    suffix="am"
    if opt["N"]
      hour=1
      suffix="pm"
    end
  else
    if opt ["N"]
      hour=hour+1
    end
  end
  opt["a"]=hour.to_s+suffix
end

# Ouput loations (cities)

if opt["L"]
  list_locations(location)
  exit
end

# output channels

if opt["C"]
  list_channels(location)
  exit
end

if opt['l']
  location=opt["l"].downcase
end

# Handle channel

if opt["c"]
  channel_search=opt["c"]
  channel_search=handle_channel(channel_search)
end

# Handle time

if opt["a"]
  time_search=opt["a"].sub(":",".")
  time_search="at "+time_search
end

# Staff picks only

if opt["r"]
  staff_search=1
else
  staff_search=0
end

# Handle content

if opt["s"]
  content_search=opt["s"]
end

if opt["a"] or opt["c"] or opt["s"] or opt["r"]
  time=Time.new
  date=time.strftime("%A %d %B %Y")
  search_tv_page(channel_search,time_search,content_search,location,staff_search,date)
end

if opt["h"]
  print_usage()
end
