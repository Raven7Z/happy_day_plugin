#!/usr/bin/env ruby

require "happy_day_plugin/version"




# module HappyDayPlugin
#   class Error < StandardError; end

#   def self.hi(p)
  	# cc = FindImage.new(p)
  	# cc.find
#   end

#   # class CH
#   # 	def initialize(p)
#   # 		@v = p 
#   # 	end
#   # 	def hello
#   # 		puts "hello" + @v
#   # 	end
#   # end

  

# end


class FindImage
  	def initialize(dir)
		@imgs = Array.new
		@mFiles = Array.new
		@dir = dir
	end

	# 获得文件夹内的所有图片
	def findImageWithPathDir(pathDir)
	
		Dir.foreach(pathDir) do |file|

			if file != '.' && file != '..' && !file.eql?('Pods')
				if File.directory? ("#{pathDir}/#{file}")

					findImageWithPathDir("#{pathDir}/#{file}")
				else 
					isPng = file.end_with? ".png"
					isJpg = file.end_with? ".jpg"
					if isPng || isJpg
						@imgs.push("#{pathDir}/#{file}")
					end
				end
			end
		end
	end

	# 获得文件夹内所有.m文件
	def findMwithPathDir(pathDir)
		Dir.foreach(pathDir) do |file|

			if file != '.' && file != '..'
				if File.directory? ("#{pathDir}/#{file}")

					findMwithPathDir("#{pathDir}/#{file}")
				else 
					isM = file.end_with? ".m"
					isJson = file.end_with? ".json"
					if isM || isJson
						@mFiles.push("#{pathDir}/#{file}")
					end
				end
			end
		end
	end

	# 检查图片是否有被使用
	def checkImageUsing
		@imgs.each do |img|
			_isUsed = false
			@mFiles.each do |file|
				# 在file中检查 img
				content = File.read(file)
				# puts content
				is2 = content =~ /#{File.basename(img, '@2x.png')}(.*)/
				is3 = content =~ /#{File.basename(img, '@3x.png')}(.*)/
				if (is2 || is3)
					_isUsed = true
				end
			end

			unless _isUsed
				outFile = File.new("unused.txt", "a+")
				if outFile
					outFile.syswrite(img)
					outFile.syswrite("\n")
				end
				puts img
			end
		end
	end

	def find
		puts "|--开始"

		findImageWithPathDir(@dir)
		findMwithPathDir(@dir)
		puts "|--没有使用\n"
		checkImageUsing

		# @imgs.each do |img|
		# 	puts img
		# end

		# @mFiles.each do |file|
		# 	puts file
		# end

		puts "|--结束"
	end

  end