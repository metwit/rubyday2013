class WeatherView < UIView
  attr_reader :weather_icon
  def initWithFrame(frame_rect)
    super.tap do |v|
      v.backgroundColor = :white.uicolor.mix_with(:blue.uicolor, 0.15)
      @weather_icon = UIImageView.alloc.init.tap do |icon|
        icon.translatesAutoresizingMaskIntoConstraints = false
        v << icon
      end

      @hills = UIImageView.alloc.initWithImage("hills".uiimage).tap do |image|
        image.translatesAutoresizingMaskIntoConstraints = false
        v << image
      end
      setup_constraints
    end
  end

  def requiresConstraintBasedLayout
    true
  end

  def setup_constraints
    views_dict = {
      'weather_icon' => @weather_icon,
      'hills' => @hills
    }
    addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[hills]|",
                                                                  options: 0,
                                                                  metrics: nil,
                                                                  views: views_dict))
    addConstraint(NSLayoutConstraint.constraintWithItem(@hills,
                                                        attribute: NSLayoutAttributeCenterX,
                                                        relatedBy: NSLayoutRelationEqual,
                                                        toItem: self,
                                                        attribute: NSLayoutAttributeCenterX,
                                                        multiplier: 1,
                                                        constant: 0))

    addConstraint(NSLayoutConstraint.constraintWithItem(@weather_icon,
                                                        attribute: NSLayoutAttributeCenterY,
                                                        relatedBy: NSLayoutRelationEqual,
                                                        toItem: self,
                                                        attribute: NSLayoutAttributeCenterY,
                                                        multiplier: 1,
                                                        constant: 0))
    addConstraint(NSLayoutConstraint.constraintWithItem(@weather_icon,
                                                        attribute: NSLayoutAttributeCenterX,
                                                        relatedBy: NSLayoutRelationEqual,
                                                        toItem: self,
                                                        attribute: NSLayoutAttributeCenterX,
                                                        multiplier: 1,
                                                        constant: 0))
  end
end
