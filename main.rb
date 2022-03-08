#!/usr/bin/env ruby
require 'colorize'
require_relative 'instructions'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative './display/app'
require 'pry'

def main
  app = App.new
  app.run
end

main
