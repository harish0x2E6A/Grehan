import "color"

color=ArgbEvaluator()
BloodVolumeColor={}
for i=0,100
  BloodVolumeColor[i]=color.evaluate(i*0.01,0xffff0000,0xff00ff00)
end

PLAYERAction={[131072]="Knock";[32776]="Knock";[131073]="Knock";[13180]="Knock";[262152]="Death"}
mDraw=LimoDrawable{
  view=window,
  onDraw=function(view,Canvas,画笔,self,fps,data)
    if DrawSwitch

      Canvas.drawText("  @GREHAN_HACKS  FPS : "..fps(),dp2,dp2,画笔)
      local IDPLAYER,IDBOT=0,0
      local 瞄准=0
      --local idx=0
      for str io.lines "/sdcard/b.log"
        str=str:gsub(";","")
        str:gsub('[^,]+', function(w)
          data[#data+1]=(w)
        end)
        local x,y,w,h,m,hp,
        ai,dz,zy,dx,name=
        tonumber(data[1]),tonumber(data[2]),
        tonumber(data[3]),tonumber(data[4]),
        tointeger(data[5]),tonumber(data[6]),
        tonumber(data[7]),tonumber(data[8]),
        tonumber(data[9]),tonumber(data[10]),
        data[11]








        table.clear(data)
      end


    end
  end
}

import "android.graphics.Paint$Cap"
mDraw().paint
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize((dp1*10))
.setTextAlign(Paint.Align.CENTER)
.setColor(0xFFFE0000)
.setFakeBoldText(true)
