# name: discourse-topic-viewers
# version: 0.0.1
# authors: Pushpender
# about: Minimal test plugin
# required_version: 3.0.0

after_initialize do
  module ::DiscourseTopicViewers
    PLUGIN_NAME = "discourse-topic-viewers"
  end

  class ::DiscourseTopicViewers::Engine < ::Rails::Engine
    engine_name DiscourseTopicViewers::PLUGIN_NAME
    isolate_namespace DiscourseTopicViewers
  end

  Discourse::Application.routes.append do
    mount ::DiscourseTopicViewers::Engine, at: "/tv-test"
  end

  ::DiscourseTopicViewers::Engine.routes.draw do
    get "/ping" => "test#index"
  end

  module ::DiscourseTopicViewers
    class TestController < ::ApplicationController
      def index
        render_json_dump(test: "PLUGIN WORKING")
      end
    end
  end
end
