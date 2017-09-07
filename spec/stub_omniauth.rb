def stub_omniauth

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
               {"provider"=>"facebook",
                "uid"=>"1446022172087896",
                "info"=>
                 {"email"=>"markavan@hotmail.com", "name"=>"Mark Van Akkeren", "image"=>"https://i.pinimg.com/736x/f3/3d/12/f33d123b2dc0adec5f80f94a97c19613--cold-feet-hold-me.jpg"},
               "credentials"=>
                {"token"=>"EAAEIqnB7ZBaUBAMv6NF33UjsROKwqUTAxVlkjL8TZBCN2ZAIe5cD5opiOyEeNZATMRjfZBhTBTcudc16Lumi4wihtNSBAarhJNQLLPZBZBhQGZA1Thd960ZBi8FcvnyVEe6MN4wZBigxyD13WY1JEi1hgnHHVv1uIcpz8ZD",
               "expires_at"=>1512769832, "expires"=>true},
               "extra"=>
               {"raw_info"=>
                 {"name"=>"Mark Van Akkeren", "email"=>"markavan@hotmail.com", "id"=>"1446022172087896"}}})


end
