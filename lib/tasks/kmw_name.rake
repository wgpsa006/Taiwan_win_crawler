# encoding: UTF-8

desc "kmw_name"
task :kmw_name => :environment do

#以下是抓取一天份的新聞

#read file 
	#input  設定時間
	#input  設定公司

	#從檔案開啟
    File.open("/Users/teinakayuu/Desktop/projects/Taiwan_win_crawler/yi.txt","r").each_line do |line|	
	#input
    #第一行公司行號 第二行年度 第三行季 第四行公司名稱
    array = line.split(' ')
    
    #公司名
    target_dir = array[0]
    
    #開始時間
    time_start = array[1]
    
    #結束時間
    time_end = array[3]
    
	#end

	#開檔
	path = "/Users/teinakayuu/Desktop/projects/Taiwan_win_crawler/download/#{target_dir}/#{time_start}"
  		dir = File.dirname(path)

  		unless File.directory?(dir)
    		FileUtils.mkdir_p(dir)
  		end

	File.open("/Users/teinakayuu/Desktop/projects/Taiwan_win_crawler/download/#{target_dir}/time_start",'a') do |f2|
				f2.puts array[2]  	
	end	

####ensure
	
	

	
#end
=begin
	# 生成 Browser instance
	browser = Watir::Browser.new :chrome
	

	# 進入知識贏家網頁並從學校授權按鈕點擊登入
	browser.goto 'http://kmw.ctgin.com'
	browser.a(:style => 'COLOR: #0055ca').click
	sleep 3

	# 進入台灣新聞區 ->新聞檢索
	browser.td(:id => 'Menu1-menuItem001').click
	browser.td(:id => 'Menu1-menuItem001-subMenu-menuItem001').click
	sleep 3

	#點選台灣地區
	#browser.frame(:id => 'if1').frame(:name => 'fLeft').td(:id => 'tabA').click
	#browser.frame(:id => 'if1').frame(:name => 'fLeft').frame(:id => 'if39').div(:id => 'i14603').span.click
	#browser.frame(:id => 'if1').frame(:name => 'fLeft').frame(:id => 'if39').div(:id => 'i14610').span.click
	#browser.frame(:id => 'if1').frame(:name => 'fLeft').frame(:id => 'if39').div(:id => 'i14636').link.click
	#sleep 3
	
	#控制時間 
	browser.frame(:id => 'if1').frame(:name => 'fTop').text_field(:id => 'txtQuery').set target_dir
 	browser.frame(:id => 'if1').frame(:name => 'fTop').text_field(:id => 'txtDateFrom').set time_start
 	browser.frame(:id => 'if1').frame(:name => 'fTop').text_field(:id => 'txtDateTo').set time_end
	
	#點選查詢
	browser.frame(:id => 'if1').frame(:name => 'fTop').input(:type => 'image', :name => 'image').click
	sleep 5 


	#先記錄網址
	href_array={}  	#用來放置網址
	href_count=1 	#網址數量	
	time_array={}	#存放頁數
	time_array[0]=0 #當今頁數
	time_array[1]=1 #總頁數

	#直到最後一頁
	until time_array[0] == time_array[1] do 
		
		#抓取頁數
		browser.frame(:id => 'if1').frame(:name => 'fCenter').frame(:id => 'if1').table(:border => '0').fonts.each do |font|
			if font.color == '#FF0000'	
				time_array = font.text.split("/")  #EX: 1/24			
			end
		end	

		#記錄網址
		browser.frame(:id => 'if1').frame(:name => 'fCenter').frame(:id => 'if1').as.each do |a|
			if a.target == 'new'
				href_array[href_count]=a.href  #把網址放入陣列 從1開始
				href_count = href_count + 1
			end
		end
		
		#印出新聞時間和新聞來源
		browser.frame(:id => 'if1').frame(:name => 'fCenter').frame(:id => 'if1').tds.each do |td|
			if td.align == 'center'
				puts td.text			
			end	
		end

		browser.frame(:id => 'if1').frame(:name => 'fCenter').frame(:id => 'if1').tds.each do |td|
			if td.align == 'right'
				puts td.text			
			end	
		end

		#點擊下一頁
		browser.frame(:id => 'if1').frame(:name => 'fCenter').frame(:id => 'if1').a(:id => 'btnPgNext1').click	
		sleep 3
	#end
		
	
		#抓取新聞資料
	for j in 1..href_count-1
		browser.frame(:id => 'if1').frame(:name => 'fCenter').frame(:id => 'if1').as.each do |a|
			browser.goto href_array[j]  #前往 內文網站
			j = j + 1
			sleep 3
			target_title = browser.td(:align => 'center').text #印出新聞title
			File.open("/Users/teinakayuu/Desktop/projects/Taiwan_win_crawler/download/2011_data/#{target_title}.txt",'w') do |f2|
					f2.puts target_title						#印出新聞title
					f2.puts browser.td(:class =>'a15gray').text #印出新聞資料
			end
		end
	end

=end
end
	browser.close
end

