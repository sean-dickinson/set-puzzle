class CardPreviewsController < ApplicationController
  def index
    render inertia: "CardPreviews"
  end
end
