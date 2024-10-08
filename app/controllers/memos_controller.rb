class MemosController < ApplicationController
  def index
    #orderによって、param[:sort]で指定された条件で結果をソートして、ソートされた結果を@memos変数に格納
    @memos = Memo.where(user_id: current_user.id).joins(:raderval).select('memos.*, radervals.*').order(params[:sort])
    memos = Memo.joins(:raderval).select('memos.*, radervals.*').order(params[:sort])

  end

  def notes
    @memo_new = Memo.new
    #orderによって、param[:sort]で指定された条件で結果をソートして、ソートされた結果を@memos変数に格納
    @memos = Memo.joins(:raderval).select('memos.*, radervals.*').order(params[:sort])
  end
 
  def create
    @memo_new = Memo.new(memos_params)
    @memo_new.save
    redirect_to memos_path, notice: 'Memo was successfully created.'
  end

  def destroy_all
    Memo.destroy_all
    redirect_to memos_path, notice: 'All Memos were successfully deleted.'
  end
 
  def update
    @memo = Memo.find(params[:id])
    @memo.update(memos_params)
    redirect_to memos_path, notice: 'Memo was successfully updated.'
  end
 
  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to memos_path, notice: 'Memo was successfully deleted.'
  end

  def import
    resource = current_user.id
    Memo.import(params[:file], resource)
    redirect_to memos_path(resource), notice: 'Import was successfully created.'
  end 
  private
 
  def memos_params
    params.require(:memo).permit(:title, :description)
  end



end
