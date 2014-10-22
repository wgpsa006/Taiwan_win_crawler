# encoding: UTF-8

desc "kmw_download crawler"
task :kmw_download => :environment do

		# 生成 Browser instance
	browser = Watir::Browser.new :chrome
	
	browser.goto 'http://kmw.ctgin.com'
	browser.a(:style => 'COLOR: #0055ca').click
	sleep 3

	File.open("/Users/teinakayuu/Desktop/projects/Taiwan_win_crawler/i13941_file_check.txt",'a') do |file_check|
	File.open("/Users/teinakayuu/Desktop/projects/Taiwan_win_crawler/file_add.txt",'r').each_line do |line|
		#抓取新聞資料

		#for j in 1..href_count-1
			#if  browser.input(:src => "/image/t56sf26.gif").exists?  
			#if frame(:id => 'if1').frame(:name => 'fCenter').frame(:id => 'if1').exists? 
			
			#browser.frame(:id => 'if1').frame(:name => 'fCenter').frame(:id => 'if1').as.each do |a|
				
				browser.goto line  #前往 內文網站
				
				sleep 3
				target_title = browser.td(:align => 'center').text #印出新聞title

				File.open("/Users/teinakayuu/Desktop/projects/Taiwan_win_crawler/download/科技資訊/#{target_title}.txt",'w') do |f2|
					f2.puts browser.td(:class =>'a15gray').text #印出新聞資料
				end
			#end
			file_check.puts line
			#j = j + 1
		end
		end

end
