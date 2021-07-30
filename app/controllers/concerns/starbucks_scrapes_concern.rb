module StarbucksScrapesConcern
    require 'open-uri'
    require 'nokogiri'

    def set_starbucks_shops
        url = 'https://product.starbucks.co.jp/beverage/?nid=mm'
    
        charset = nil
        html = URI.open(url) do |f|
          charset = f.charset
          f.read
        end
    
        doc = Nokogiri::HTML.parse(html, nil, charset)
    
        @drinks = []
        @images = []
        
        doc.xpath('//p[@class="itemImage"]/img[@class="js-scroll_load"]').each do |node|
          @images << "https://product.starbucks.co.jp"+node.attribute('data-original').value
        end

        doc.xpath('//p[@class="productName"]').each do |node|
          @drinks << node.text
        end
        return @drinks,@images
    end

    def set_dotor_shops
      url1 = 'https://www.doutor.co.jp/dcs/menu/list/hotdrink.html'
      url2 = 'https://www.doutor.co.jp/dcs/menu/list/icedrink.html'
  
      charset = nil
      html1 = URI.open(url1) do |f|
        charset = f.charset
        f.read
      end
  
      doc1 = Nokogiri::HTML.parse(html1, nil, charset)

      html2 = URI.open(url2) do |f|
        charset = f.charset
        f.read
      end
  
      doc2 = Nokogiri::HTML.parse(html2, nil, charset)
  
      @drinks = []

      doc1.xpath('//span[@class="rt_cf_product_name"]').each do |node|
        @drinks << node.text
      end

      doc2.xpath('//span[@class="rt_cf_product_name"]').each do |node|
        @drinks << node.text
      end
     
      return @drinks
   end

   def set_tullys_shops
    url = 'https://www.tullys.co.jp/menu/drink/'

    charset = nil
    html = URI.open(url) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)

    @drinks = []

    doc.xpath('//p').each do |node|
      @drinks << node.text
    end
    return @drinks
   end


end