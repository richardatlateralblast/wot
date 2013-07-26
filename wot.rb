#!/usr/bin/env ruby

# Name:         wot (What's On TV)
# Version:      0.0.3
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

# Set up some defaults

$script=$0
location="melbourne"
time_search=""
channel_search=""

def print_usage
  puts ""
  puts "Usage: "+$script+" -[h|C] -c Channel -a Time -l Location"
  puts "-h: Display usage"
  puts "-c: Channel [TEN,ABC1,..]"
  puts "-a: Time [8,8.00,8:30,..]" 
  puts "-l: Location"
  puts "-C: List channels"
  puts "-L: List locations"
  puts "-n: What's on TV now (to the current hour)"
  puts "-N: What's on TV next (to the next hour"
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
  doc = Nokogiri::HTML(open(base_url))
  doc.css('div.venue-name img').each do |node|
    channel_name=node[:title]
    puts channel_name
  end
  return
end

def list_locations(location)
  base_url="http://www.yourtv.com.au/guide/"
  full_url=base_url+location+"/"
  puts "Locations:"
  doc = Nokogiri::HTML(open(base_url))
  doc.css('li a').each do |node|
    if node.to_s.match(/ TV Guide/)
      location_name=node.text.split(/ /)[0]
      puts location_name
    end
  end
  return
end

def search_tv_page(channel_search,time_search,location)
  base_url="http://www.yourtv.com.au/guide/"
  full_url=base_url+location+"/"
  doc = Nokogiri::HTML(open(base_url))
  doc.css('div.pname a').each do |node|
    prog_info=node[:title]
    if channel_search.match(/[A-z]/) 
      if prog_info.match(channel_search)
        if time_search.match(/[0-9]/) 
          if prog_info.match(time_search)
            puts prog_info
          end
        else 
          puts prog_info
        end 
      end
    else
      if time_search.match(/[0-9]/) 
        if prog_info.match(time_search)
          puts prog_info
        end
      else
        puts prog_info
      end
    end
  end
  return
end

begin
  opt = Getopt::Std.getopts("c:a:l:hnCLNV")
rescue 
  print_usage        
end

if opt["V"]
  print_version
  exit
end

if opt["n"] or opt["N"]
  time=Time.new
  hour=time.hour
  min=time.min
  if hour > 12
    hour=hour-12
  end
  if opt ["N"]
    hour=hour+1
  end
  opt["a"]=hour.to_s
end

if opt["L"]
  list_locations(location)
  exit
end

if opt["C"]
  list_channels(location)
  exit
end

if opt['l']
  location=opt["l"].downcase
end

if opt["c"]
  channel_search=opt["c"].upcase
  channel_search="on "+channel_search
end

if opt["a"]
  time_search=opt["a"].sub(":",".")
  time_search="at "+time_search
end

if opt["a"] or opt["c"]
  search_tv_page(channel_search,time_search,location)
end

if opt["h"]
  print_usage()
end
