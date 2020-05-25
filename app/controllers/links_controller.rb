class LinksController < ApplicationController
  def index

  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to @link, notice: "Link was successfully created."
    else
      render :new
    end
  end

  def edit
    @link = find_link
  end

  def update
    @link = current_user.links.find(params[:id])

    if @link.update(link_params)
      redirect_to @link, notice: "Link was successfully updated."
    else
      render :new
    end
  end

  def show
    @link = find_link
    @stats = find_stats
  end

  def destroy
    link = find_link
    link.destroy

    redirect_to root_path, notice: "Link was successfully removed"
  end

  private

  def link_params
    params
      .require(:link)
      .permit(
        :slug,
        :title,
        :url
      )
  end

  def find_link
    current_user.links.find(params[:id])
  end

  def find_stats
    Ahoy::Event
      .where_event("Open slug", link_id: @link.id)
      .includes(:visit)
      .order("time desc")
  end
end
