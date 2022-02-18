class IssuesController < ApplicationController

  def new
      @issue = Issue.new
      authorize @issue
  end

end
