module Jekyll
    class RenameSitemap
      Jekyll::Hooks.register :site, :post_write do |site|
        # Define the old and new file paths
        sitemap_path = File.join(site.dest, "sitemap.xml")
        new_sitemap_path = File.join(site.dest, "sitemap-new.xml")
        
        # Check if sitemap.xml exists
        if File.exist?(sitemap_path)
          # Rename the file
          File.rename(sitemap_path, new_sitemap_path)
          Jekyll.logger.info "Sitemap renamed:", "sitemap.xml -> sitemap-new.xml"
        else
          Jekyll.logger.warn "Sitemap not found:", "No sitemap.xml was generated."
        end
      end
    end
  end
  