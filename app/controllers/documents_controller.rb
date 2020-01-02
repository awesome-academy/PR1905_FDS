class DocumentsController < ApplicationController
  def index   
    @documents = Document.all   
  end   
  
  def new   
    @document = Document.new   
  end   
    
  def create   
    @document = Document.new(document_params)   
    if @document.save
      flash[:success]= "Successfully uploaded."
      redirect_to documents_path
    else 
      flash.now[:danger] = "Upload failed"  
      render "new"   
    end   
  end   
    
  def destroy   
    @document = Document.find(params[:id])   
    @document.destroy   
    redirect_to documents_path, notice: "Successfully deleted."   
  end   
    
  private   
    def document_params   
    params.require(:document).permit(:name, :attachment, :description)   
  end   
end
