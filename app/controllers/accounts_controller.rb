# frozen_string_literal: true

class AccountsController < ApplicationController
  def show
    @user = current_user
  end
end
