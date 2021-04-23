module Career
  class Engine < ::Rails::Engine
    isolate_namespace Career

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
