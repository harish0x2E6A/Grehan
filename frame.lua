function FPS(num)
  if not fps_tab
    fps_tab={[num]={
        fps=0,
        lastTime=Date().time,
        frameCount=0
      }}
  end
  if not fps_tab[num]
    fps_tab[num]={
      fps=0,
      lastTime=Date().time,
      frameCount=0
    }
  end
  $obj=fps_tab[num]
  obj.frameCount=obj.frameCount+1
  $curTime=Date().time
  if (curTime - obj.lastTime > 1000)
    obj.fps = obj.frameCount;
    obj.frameCount = 0;
    obj.lastTime = curTime;
  end
  return obj.fps
end

function LimoDrawable(callback)
  if not callback.data
    callback.data={}
  end
  if callback.HardwareAcceleration==false
    callback.view.setLayerType(1,nil)
  end
  $Fps=lambda:FPS(string.format("%p",callback))
  local draw
  if callback.AutoRefresh~=false
    draw=(lambda a,b,c:callback.onDraw(callback.view,a,b,c,Fps,callback.data),c.invalidateSelf())
   else
    draw=lambda a,b,c:callback.onDraw(callback.view,a,b,c,Fps,callback.data)
  end
  $drawble=LuaDrawable(draw)
  callback.view.post(
  lambda:callback.view.setBackground(drawble)
  )
  return setmetatable({data=callback.data,Refresh1=lambda:drawble.invalidateSelf()},{__call=(lambda:drawble),__tostring=(lambda:"draw: "..string.format("%p",callback))})
end