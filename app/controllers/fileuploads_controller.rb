class FileuploadsController < ApplicationController
    
    # GET /fileuploads
    # GET /fileuploads.xml
    def index
      @fileuploads = Fileupload.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @fileuploads }
      end
    end
  
    # GET /fileuploads/1
    # GET /fileuploads/1.xml
    def show
      @fileupload = Fileupload.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @fileupload }
      end
    end
  
    # GET /fileuploads/new
    # GET /fileuploads/new.xml
    def new
      @fileupload = Fileupload.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @fileupload }
      end
    end

    # GET /fileuploads/1/edit
    def edit
      @fileupload = Fileupload.find(params[:id])
    end

    # POST /fileuploads
    # POST /fileuploads.xml
    def create
        uploaded_io = params[:fileupload][:uploaded_file]
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
            file.write(uploaded_io.read)
        end
        
        @fileUpload = Fileupload.new(params[:fileupload])
        
        respond_to do |format|
            if @fileUpload.save
                flash[:notice] = 'File was successfully uploaded.'
                format.html { redirect_to(@fileUpload) }
                #format.xml  { render :xml => @fileUpload, :status => :created, :location => @fileUpload }
            else
                format.html { render :action => "new" }
                #format.xml  { render :xml => @fileUpload.errors, :status => :unprocessable_entity }
            end
        end
    end

    # PUT /fileuploads/1
    # PUT /fileuploads/1.xml
    def update
      @fileupload = Fileupload.find(params[:id])
  
      respond_to do |format|
        if @fileupload.update_attributes(params[:fileupload])
          format.html { redirect_to(@fileupload, :notice => 'Fileupload was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @fileupload.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /fileuploads/1
    # DELETE /fileuploads/1.xml
    def destroy
      @fileupload = Fileupload.find(params[:id])
      @fileupload.destroy
  
      respond_to do |format|
        format.html { redirect_to(fileuploads_url) }
        format.xml  { head :ok }
      end
    end
  
end
