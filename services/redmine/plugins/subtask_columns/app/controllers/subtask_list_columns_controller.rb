class SubtaskListColumnsController < ApplicationController
  helper :queries
  include QueriesHelper
   
  def index             
    @project = Project.find(params[:project_id])    
    @selectedColumns = SubtaskListColumns.all.select {|c| c.prj_id == @project.id}.sort_by{|o| o.order}.collect{|f| f.ident}       
    @selectedColumns = ["#"] unless @selectedColumns.count >0 
    @query = IssueQuery.new(:column_names => @selectedColumns)
    @query.project = @project
  end
 
  def update         
    if params["commit"] == "Save"
        updateSelectedColumns = params[:c] || []         
        SubtaskListColumns.delete_all(["prj_id=?",params[:project_id]])       
        order = 0
        updateSelectedColumns.each do |col|
          #tracker, subject is always included, so skip
          if  ['tracker', 'subject'].include? col
            next
          end     
          c = SubtaskListColumns.new
          order = order +1
          c.prj_id = params[:project_id]
          c.ident = col
          c.order = order
          c.save      
          #TODO: do lazy save
        end        
     end   
     redirect_to :back
  end  
end
