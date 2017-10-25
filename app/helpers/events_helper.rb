module EventsHelper
  def event_dead_changer(event)
    today = Date.today
    if event.dead == today
      text = "今日です"
    elsif event.dead >= today
      #一度整数型に変換した後、文字列型に変換(分数で表示されるのを防ぐ)
      text = "あと：" + (event.dead - today).to_i.to_s + "日"
    else
      text = "経過：" + (today - event.dead).to_i.to_s + "日"
    end
  end
end
