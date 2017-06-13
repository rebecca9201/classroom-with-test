require_relative "../base"

module PageObjects
  module Application
    class Navbar < Base
      def sign_in
        click_on "Login"
        PageObjects::Devise::Sessions::New.new
      end

      def sign_out(email)
        dropdown(email).click_on "Logout"
      end

      private

      def dropdown(email)
        find ".navbar .dropdown", text: email
      end
    end
  end
end
