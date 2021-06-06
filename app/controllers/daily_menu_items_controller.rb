class DailyMenuItemsController < ApplicationController

    def index
        @dailyItems = DailyMenuItem.all
    end

    def new
        @dailyItem = DailyMenuItem.new
    end

    def show
        @dailyItem = DailyMenuItem.find(params[:id])
    end

    def edit
        @dailyItem = DailyMenuItem.find(params[:id])
    end

    def update
        @dailyItem = DailyMenuItem.find(params[:id])
        @dailyItem.menu_item_id = params[:menu_item_id]

        if @dailyItem.update(daily_item_params)
          redirect_to daily_menu_items_path
        else
          render 'edit'
        end
    end

    def destroy
        @dailyItem = DailyMenuItem.find(params[:id])

        @dailyItem.destroy
        redirect_to daily_menu_items_path
    end

    def create
        @dailyItem = DailyMenuItem.new(daily_item_params)

        if @dailyItem.save
          redirect_to daily_menu_items_path
        else
          render 'new'
        end
    end

    private def daily_item_params
        params.require(:daily_menu_item).permit(:menu_item_id, :price)
    end

end
