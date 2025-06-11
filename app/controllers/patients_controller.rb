class PatientsController < ApplicationController
  include Pagy::Backend
  
  def index
    per_page = params[:per_page].to_i > 0 ? params[:per_page].to_i : 25
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    
  
    pagy, patients = pagy(Patient.order(id: :desc), limit: params[:per_page], page: page)
  
    render json: {
      data: patients.map do |p|
        {
          id: p.id,
          name: p.name,
          gender: p.gender,
          phone: p.phone
        }
      end,
      pagy: {
        count: pagy.count,
        page: pagy.page,
        items: pagy.vars[:items],
        pages: pagy.pages
      }
    }
  end
  
  
  

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
