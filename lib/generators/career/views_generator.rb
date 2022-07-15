require "rails/generators"

module Career
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../app", __FILE__)
      desc "This generator copies the career views to your application."

      def copy_views
        directory "views/career/tasks", "app/views/career/tasks"
      end

      def add_routes
        double_quotes_res = run "grep -rnw 'config/routes.rb' -e '^\s*mount Career::Engine => \"/career\"'"
        single_quotes_res = run "grep -rnw 'config/routes.rb' -e '^\s*mount Career::Engine => \'/career\''"

        if !single_quotes_res && !double_quotes_res
          print "No routes found. Adding career routes...\n"
          route 'mount Career::Engine => "/career"'
        end
      end
    end
  end
end
