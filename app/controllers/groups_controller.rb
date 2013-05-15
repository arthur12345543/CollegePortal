#encoding: utf-8
class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    if current_user && current_user.role && current_user.role.can_edit_schedule 
      @group = Group.new(params[:group])
      if @group.save
        @group.day.create(:name=>"Понедельник")
        @group.day.create(:name=>"Вторник")
        @group.day.create(:name=>"Среда")
        @group.day.create(:name=>"Четверг")
        @group.day.create(:name=>"Пятница")	
        @group.day.all.each do|l|
          for i in 1..4
            l.lesson.create
          end  
        end
      redirect_to schedule_path
      else
        render :action => :new
      end
    else
      redirect_to root_path
    end
  end

  def destroy  
    if current_user && current_user.role && current_user.role.can_edit_schedule 
      @Group = Group.find(params[:id])
      @Group.day.all.each do|day|
        day.lesson.all.each do|lesson|
  	      lesson.destroy
        end
        day.destroy
      end
    @Group.destroy
    redirect_to schedule_path
    end
  else
    redirect_to root_path
  end
end
