require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SchedulesController do

  before :each do
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('master','secret')
  end
  # This should return the minimal set of attributes required to create a valid
  # Schedule. As you add validations to Schedule, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {'content' => 'Lorem Ipsum', 'long_course' => true, 'date' => 3.days.ago.to_date}
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created schedule as @schedule" do
        post :create, :schedule => valid_attributes
        assigns(:schedule).should be_a(Schedule)
        assigns(:schedule).should be_persisted
      end
      it "should set the created_at to Time.now" do
        t=Time.now
        Time.stubs(:now=>t)
        post :create, :schedule => valid_attributes
        assigns(:schedule).created_at.should eq(t)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Schedule.any_instance.stubs(:save).returns(false)
        post :create, :schedule => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested schedule" do
        schedule = Schedule.create valid_attributes
        # Assuming there are no other schedules in the database, this
        # specifies that the Schedule created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Schedule.any_instance.expects(:update_attributes).with({'these' => 'params'})
        put :update, :id => schedule.id, :schedule => {'these' => 'params'}
      end

      it "assigns the requested schedule as @schedule" do
        schedule = Schedule.create valid_attributes
        put :update, :id => schedule.id, :schedule => valid_attributes
        assigns(:schedule).to_json.should eq(schedule.to_json)
      end

      it "redirects to the schedule" do
        schedule = Schedule.create valid_attributes
        put :update, :id => schedule.id, :schedule => valid_attributes
        response.should redirect_to(schedule)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        schedule = Schedule.create valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Schedule.any_instance.stubs(:save).returns(false)
        put :update, :id => schedule.id.to_s, :schedule => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "redirects to the schedules list" do
      schedule = Schedule.create valid_attributes
      delete :destroy, :id => schedule.id.to_s
      response.should redirect_to(schedules_url)
    end
  end

end
