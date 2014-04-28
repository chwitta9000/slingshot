class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
    authorize! :create, Ticket, message: "You need to be a member to sell a ticket."
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    authorize! :create, @post, message: "You need to be a member to sell a ticket."
    if @ticket.save!
      flash[:notice] = "Ticket was saved successfully."
      redirect_to @ticket
    else
      flash[:error] = "There was an error saving your ticket.  Please try again."
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
    authorize! :edit, @ticket, message: "You need to own the ticket to edit it."
  end

  def update
    @ticket = Ticket.find(params[:id])
    authorize! :edit, @ticket, message: "You need to own the ticket to edit it."
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Ticket successfully updated."
      redirect_to @ticket
    else
      flash[:error] = "There was an error saving your ticket.  Please try again."
      render :edit
    end
  end

end
