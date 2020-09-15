#!/usr/bin/env ruby

# require 'student.rb'
require './file_handler'
require './class_editor'
require './group_builder'
require './group_print'
require 'csv'

csv = read_file
csv = q_modify(csv)
groups = constraints(csv)
groups = list_groups(groups)
write_to_file(groups)
