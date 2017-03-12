class CrawlerV
  PAGE_COUNT = 36
  class << self
    def source page
      page = nil if page == "_0"
      "http://v.17173.com/lol/2016/new/new#{page}.shtml"
    end

    def run
      agent = Mechanize.new
      (0 .. PAGE_COUNT).each do |page|
        begin
          agent.get source("_#{page}")
          html = agent.page.root
          video_divs = html.search(".v-list")
          extract_video video_divs
        rescue => e
          puts e.inspect
        end
      end
    end

    def extract_video video_divs
      video_divs.each do |video_div|
        a = video_div.search(">a")
        img = video_div.search("img")
        url = a.attr("href").value
        title = a.attr("title").value
        img_url = img.attr("src").value

        Video.create(video_type: Video::LOL, url: url, title: title, img_url: img_url)
      end
    end
  end
end