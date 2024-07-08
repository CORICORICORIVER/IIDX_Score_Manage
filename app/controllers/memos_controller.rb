class MemosController < ApplicationController
  def index
    @memo_new = Memo.new
    @memos = Memo.all
  end
 
  def create
    @memo_new = Memo.new(memos_params)
    @memo_new.save
    redirect_to home_path, notice: 'Memo was successfully created.'
  end
 
  def update
    @memo = Memo.find(params[:id])
    @memo.update(memos_params)
    redirect_to home_path, notice: 'Memo was successfully created.'
  end
 
  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to home_path, notice: 'Memo was successfully created.'
  end

  def import
    Memo.import(params[:file])
    redirect_to root_url, notice: 'Import was successfully created.'
  end 
  private
 
  def memos_params
    params.require(:memo).permit(:title, :description)
  end


end
