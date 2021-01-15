class RelationshipsController < Base
  def create
    Relationship.create!(following_id: session[:user_id], follower_id: params[:user_id])
    puts "#{Relationship.all}"
    redirect_to user_path(params[:user_id])
  end

  def destroy
  end
end
