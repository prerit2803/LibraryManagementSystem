require 'spec_helper'

describe RoomsController do
  describe "GET #index" do
    it "populates an array of rooms"
    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested room to @room"
    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new room to @room"
    it "renders the :new template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new room in the database"
      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "does not save the new room in the database"
      it "re-renders the :new template"
    end
  end
end