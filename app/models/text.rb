class Text < Widget

  def as_json(options={})
    super only: [:id, :type, :sort_order, :data]
  end

  # example

  #def as_json(options={})
    #super(:only => [:city,:state],
          #:methods => [:full_name],
          #:include => {
            #:employers => {:only => [:title]},
            #:roles => {:only => [:name]}
          #}
    #)
  #end

end
