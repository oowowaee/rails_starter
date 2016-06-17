module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      #user.confirm # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end
end

module FeatureMacros
  def login_user(user)
    visit new_user_session_path

    fill_in("user_email", with: user.email)
    fill_in("user_password", with: user.password)
    click_button(t('form.login'))
  end

  def visit_activation_link
    link = ActionMailer::Base.deliveries.last.body.raw_source
    link_start = link.index("3000")
    link = link[link_start + 4, link.length]
    link_end = link.index('"')
    link = link[0, link_end]
    visit link
  end
end