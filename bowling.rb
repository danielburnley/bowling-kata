class Bowling
  def initialize
    @pins = []
  end

  def roll(pins)
    @pins << pins
  end

  def score
    frames = []

    while frames_remaining?
      frames << score_frame
      progress_to_next_frame
    end

    frames.sum
  end

  private

  def frames_remaining?
    @pins.any?
  end

  def progress_to_next_frame
    if @pins[0] == 10
      @pins.shift(1)
    else
      @pins.shift(2)
    end
  end

  def score_frame
    return @pins[0] if @pins.length == 1

    return calculate_special_value if is_strike? || is_spare?

    @pins[0] + @pins[1]
  end

  def is_strike?
    @pins[0] == 10
  end

  def is_spare?
    @pins[0] + @pins[1] == 10
  end

  def calculate_special_value
    @pins[0] + @pins[1] + @pins[2]
  end
end
