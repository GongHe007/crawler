游戏新闻视频爬虫接口
请求http://locahost:3000/api/videos?page=#{page}&per_page=#{per_page}
page是第几页，per_page是每页有多少条数据
返回格式json:
{
  videos:
  {
    id: 5,  #真实ID，暂时没有隐藏
    video_type: 0,  #视频类型，目前0表示LOL的视频
    url: "http://v.17173.com/z_1_10898/Mzg3Mzg4MDI.html",  #视频链接
    img_url: "http://p3.v.17173cdn.com/vw0tha/YWxqaGBf/uploads/images/video/20170311/38738802_1.jpg",  #视频封面图链接
    title: "JY解说：新月之光  夜幕下的法师黛安娜",    #视频标题
    created_at: Sun, 12 Mar 2017 14:50:58 CST +08:00,   #创建时间，是在本地数据库创建的时间，与网站无关
    updated_at: Sun, 12 Mar 2017 14:50:58 CST +08:00>,  #更新时间，与创建时间同理
  }
}