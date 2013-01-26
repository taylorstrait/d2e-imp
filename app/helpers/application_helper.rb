module ApplicationHelper

  def add_icons(text)
    text.gsub!("{ACTION}", "<img src='/assets/icons/Action.png' alt='Action' title='Action'/>")
    text.gsub!("{HEART}", "<img src='/assets/icons/Heart.png' alt='Heart' title='Heart'/>")
    text.gsub!("{FATIGUE}", "<img src='/assets/icons/Fatigue.png' alt='Fatigue' title='Fatigue'/>")
    text.gsub!("{SURGE}", "<img src='/assets/icons/Surge.png' alt='Surge' title='Surge'/>")
    text.gsub!("{SHIELD}", "<img src='/assets/icons/Shield.png' alt='Shield' title='Shield'/>")

    text.gsub!("{MIGHT}", "<img src='/assets/icons/Might.png' alt='Might' title='Might' />")
    text.gsub!("{KNOWLEDGE}", "<img src='/assets/icons/Knowledge.png' alt='Knowledge' title='Knowledge' />")
    text.gsub!("{WILLPOWER}", "<img src='/assets/icons/Willpower.png' alt='Willpower' title='Willpower' />")
    text.gsub!("{AWARENESS}", "<img src='/assets/icons/Awareness.png' alt='Awareness' title='Awareness' />")
    
    text.gsub!("{BROWN}", "<img src='/assets/icons/dice-brown.png' height='32' width='32' alt='Brown Dice' title='Brown Dice' />")
    text.gsub!("{GREY}", "<img src='/assets/icons/dice-grey.png' height='32' width='32' alt='Grey Dice' title='Grey Dice' />")
    text.gsub!("{BLACK}", "<img src='/assets/icons/dice-black.png' height='32' width='32' alt='Black Dice' title='Black Dice' />")    
    text.gsub!("{BLUE}", "<img src='/assets/icons/dice-blue.png' height='32' width='32' alt='Blue Dice' title='Blue Dice' />")
    text.gsub!("{YELLOW}", "<img src='/assets/icons/dice-yellow.png' height='32' width='32' alt='Yellow Dice' title='Yellow Dice' />")
    text.gsub!("{RED}", "<img src='/assets/icons/dice-red.png' height='32' width='32' alt='Red Dice' title='Red Dice' />")

    return text.html_safe

  rescue NoMethodError
    return nil
  end

  def fancy_output(text)
      simple_format(add_icons(text))
  end
end
