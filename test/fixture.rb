require 'rubygems'
require 'sinatra'
require File.dirname(__FILE__) + '/../lib/sinatra/memcache'

get '/' do
  "Hello World"
end

get '/cache' do
  cache "cache" do
    "Hello World"
  end
end

get '/cache2' do
  cache "cache2", :expiry => 1 do
    "Hello World"
  end
end

get '/compress' do
  cache "compress", :compress => true do
    "Hello Compress"
  end
end

get '/expire' do
  expire "cache"
end

get '/expire_re' do
  expire /^cache/
end

configure do
  set :cache_namespace, "test"
  set :cache_logging, false
end
