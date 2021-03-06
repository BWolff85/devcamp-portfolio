class PortfoliosController < ApplicationController
  layout "portfolio"

  def index
      @portfolio_items = Portfolio.all
  end

  def swab
      @swab_portfolio_items = Portfolio.swab
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def new
      @portfolio_item = Portfolio.new
      3.times { @portfolio_item.technologies.build }
  end

  def create
      @portfolio_item = Portfolio.new(portfolio_item_params)

      respond_to do |format|
        if @portfolio_item.save
          format.html { redirect_to portfolios_path, notice: "Boom! That worked." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
  end

  def edit
      @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #perform lookup
    @portfolio_item = Portfolio.find(params[:id])
    
    #destroy the record
    @portfolio_item.destroy
    
    #redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Portfolio was successfully destroyed." }
    end
  end
    
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def portfolio_item_params
    params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end
end
