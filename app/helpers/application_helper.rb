module ApplicationHelper

  def add_icons(text)
    text.gsub!("{ACTION}", "<img src='/assets/icons/Action.png' alt='Action' title='Action'/>")
    text.gsub!("{HEALTH}", "<img src='/assets/icons/Heart.png' alt='Health' title='Health'/>")
    text.gsub!("{FATIGUE}", "<img src='/assets/icons/Fatigue.png' alt='Fatigue' title='Fatigue'/>")
    text.gsub!("{SURGE}", "<img src='/assets/icons/Surge.png' alt='Surge' title='Surge'/>")
    text.gsub!("{DEFENSE}", "<img src='/assets/icons/Shield.png' alt='Defense' title='Defense'/>")

    text.gsub!("{MIGHT}", "<img src='/assets/icons/Might.png' alt='Might' title='Might' />")
    text.gsub!("{KNOWLEDGE}", "<img src='/assets/icons/Knowledge.png' alt='Knowledge' title='Knowledge' />")
    text.gsub!("{WILLPOWER}", "<img src='/assets/icons/Willpower.png' alt='Willpower' title='Willpower' />")
    text.gsub!("{AWARENESS}", "<img src='/assets/icons/Awareness.png' alt='Awareness' title='Awareness' />")
    
    text.gsub!("{BROWN}", "<img src='/assets/icons/dice-brown.png' alt='Brown Dice' title='Brown Dice' />")
    text.gsub!("{GREY}", "<img src='/assets/icons/dice-grey.png' alt='Grey Dice' title='Grey Dice' />")
    text.gsub!("{BLACK}", "<img src='/assets/icons/dice-black.png' alt='Black Dice' title='Black Dice' />")    
    text.gsub!("{BLUE}", "<img src='/assets/icons/dice-blue.png' alt='Blue Dice' title='Blue Dice' />")
    text.gsub!("{YELLOW}", "<img src='/assets/icons/dice-yellow.png' alt='Yellow Dice' title='Yellow Dice' />")
    text.gsub!("{RED}", "<img src='/assets/icons/dice-red.png' alt='Red Dice' title='Red Dice' />")

    return text.html_safe

  rescue NoMethodError
    return nil
  end
end
