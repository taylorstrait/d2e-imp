module ApplicationHelper

  # substitutes images for codes
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
    
    text.gsub!("{1HAND}", "<img src='/assets/icons/item-1hand.png' height='52' width='48' alt='1 Hand' title='1 Hand' />")
    text.gsub!("{2HAND}", "<img src='/assets/icons/item-2hand.png' height='52' width='48' alt='2 Hand' title='2 Hand' />")
    text.gsub!("{ARMOR}", "<img src='/assets/icons/item-armor.png' height='52' width='48' alt='Armor' title='Armor' />")
    text.gsub!("{OTHER}", "<img src='/assets/icons/item-other.png' height='52' width='48' alt='Other' title='Other' />")

    return text.html_safe

  rescue NoMethodError # if text is nil, fail gracefully
    return nil
  end



  # wraps add_icons in simple_format to preserve newlines in output
  # USE THIS instead of add_icons
  def fancy_output(text)
      simple_format(add_icons(text))
  end



  def sample_rating
    output = ""
    rand(5).times do
      output += "<i class='icon-star' />"
    end

    return output.html_safe
  end


  # creates a link to an object that uses bootstrap popup to display a preview image in popover window on hover
  # requires the popover call in application.js
  def popup_link(object, img_dir=object.class.name.underscore.pluralize)
    return "<a href='/#{object.class.name.underscore.pluralize}/#{object.slug}', class= 'object-popup', data-title= '#{object.name.gsub("'", "&rsquo;")}', data-content= '<img src= /assets/cards/#{img_dir}/#{object.slug}.jpg />' >#{object.name}</a>".html_safe
  end

  
end
