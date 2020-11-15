require "rails_helper"
require 'byebug'

RSpec.describe "Posts", type: :request do

  describe "GET /posts" do
    before {get '/posts'}

    it "should return OK" do
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
      end
    end

    describe "with data in the DB" do
      let!(:post) { create_list(:post, 10, published: true) }
      before { get '/posts' }

      it "should return all the published posts" do
        get '/posts'
        payload = JSON.parse(response.body)
        expect(payload.size).to eq(post.size)
        expect(response).to have_http_status(200)
      end
    end

  describe "GET /post/{id}" do
    let!(:post) { create(:post) }

    it "should return a posts" do
      get "/posts/#{post.id}"
      payload = JSON.parse(response.body)
      expect(payload).to_not must_be_empty
      expect(payload["id"]).to eq(post.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST"

end