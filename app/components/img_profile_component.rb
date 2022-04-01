# frozen_string_literal: true
class ImgProfileComponent < ViewComponent::Base
  attr_reader :profile
  def initialize(profile:)
    @profile = profile
  end

end
