class SchedulesController < ApplicationController
  def index
      @schedules = Schedule.all
  end

  def new
      @schedule = Schedule.new()
  end

  def create
      @schedule = Schedule.new(title: params[:title], start: params[:start], finish: params[:finish], memo: params[:memo], all_day: params[:all_day])

      if @schedule.save
          flash[:notice] = "スケジュールを新規登録しました"
          redirect_to("/schedules/index")
      else
          flash[:alert] = "登録に失敗しました"
          render "schedules/new"
      end
  end

  def show
      @schedule = Schedule.find_by(id: params[:id])
  end

  def edit
      @schedule = Schedule.find_by(id: params[:id])

  end

  def update
      @schedule = Schedule.find_by(id: params[:id])
      @schedule.title = params[:title]
      @schedule.start = params[:start]
      @schedule.finish = params[:finish]
      @schedule.all_day = params[:all_day]
      @schedule.memo = params[:memo]

      if @schedule.save
          flash[:notice] = "更新が完了しました"
          redirect_to("/schedules/index")
      else
          flash[:alert] = "更新に失敗しました"
          render "schedules/edit"
      end
  end

  def destroy
      @schedule = Schedule.find_by(id: params[:id])
      @schedule.destroy
      flash[:notice] = "スケジュールを削除しました"
      redirect_to("/schedules/index")
  end
end
