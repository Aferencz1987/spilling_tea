class Api::V1::CustomersController < ApplicationController
  def index
    customers = Customer.all

    render json:  customers
  end
  #
  # def show
  #
  # end
  #
  # def edit
  #
  # end
  #
  # def
  #
  # end

end
