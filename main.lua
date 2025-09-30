require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.*"
import "android.content.*"
import "android.provider.*"
import "android.net.*"
import "android.support.v4.widget.*"
import "AndLua"

import "home"
import "java.io.File"

import "android.content.*"
import "android.net.*"
import "android.provider.Settings"
import "android.content.Context"
import "android.view.animation.*"
import "android.graphics.PorterDuffColorFilter"
import "AndLua"
import "http"
import "frame"
import "draw"
import "color"


import "android.speech.tts.TextToSpeech"
import "android.media.AudioManager"
import "android.graphics.drawable.ColorDrawable"
import "android.provider.Settings$Secure"


function CircleButton(view,InsideColor,radiu,InsideColor1)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setCornerRadii({radiu, radiu, radiu, radiu, radiu, radiu, radiu, radiu})
  drawable.setColor(InsideColor)
  drawable.setStroke(2, InsideColor1)
  view.setBackgroundDrawable(drawable)
end



function CircleButton4(view,InsideColor,radiu,InsideColor1)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setCornerRadii({radii, radiu, radiu, radiu, radiu, radii, radiu, radiu})
  drawable.setColor(InsideColor)
  drawable.setStroke(4, InsideColor1)
  view.setBackgroundDrawable(drawable)
end

function CircleButton6(view,InsideColor,radiu,InsideColor1)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setCornerRadii({radii, radiu, radiu, radiu, radiu, radii, radiu, radiu})
  drawable.setColor(InsideColor)
  drawable.setStroke(2, InsideColor1)
  view.setBackgroundDrawable(drawable)
end

function CircleButton5(view,InsideColor,radiu,InsideColor1)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setCornerRadii({radii, radii, radiu, radiu, radiu, radii, radii, radiu})
  drawable.setColor(InsideColor)
  drawable.setStroke(4, InsideColor1)
  view.setBackgroundDrawable(drawable)
end








function LoginLY()
  import "login"
  import "home"


  activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
  activity.setContentView(loadlayout(login))
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFF212121);

  appName.setTypeface(Typeface.DEFAULT_BOLD)
  hide1.setVisibility(View.GONE)
  import "android.text.method.HideReturnsTransformationMethod"
  import "android.text.method.PasswordTransformationMethod"


  txtPassword.setTransformationMethod(HideReturnsTransformationMethod.getInstance())
  txtPassword.setTransformationMethod(PasswordTransformationMethod.getInstance())
  function tt.onClick
    url = "https://t.me/Grehan_Mods"
    activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
  end
  function hide1.onClick()
    show1.setVisibility(View.VISIBLE)
    hide1.setVisibility(View.GONE)
    txtPassword.setTransformationMethod(PasswordTransformationMethod.getInstance())
  end

  function show1.onClick()
    show1.setVisibility(View.GONE)
    hide1.setVisibility(View.VISIBLE)
    txtPassword.setTransformationMethod(HideReturnsTransformationMethod.getInstance())
  end

  contentPaste.onClick=function()
    local copiedUserPass = activity.getSystemService(Context.CLIPBOARD_SERVICE).getText()
    if copiedUserPass== "" then
      Toast.makeText(activity, "Please copy text !",Toast.LENGTH_SHORT).show()
     else
      if string.find(copiedUserPass,":") then
        local copiedUser,copiedPass = copiedUserPass:match("([^,]+):([^,]+)")
        txtUsername.setText(copiedUser)
        txtPassword.setText(copiedPass)
       else
        Toast.makeText(activity, "Please copy text !",Toast.LENGTH_SHORT).show()
      end
    end
  end
  local user,pass
  local pref = activity.getSharedPreferences("LieShooter", Context.MODE_PRIVATE);
  user = pref.getString("username", "");
  pass = pref.getString("password", "");
  txtUsername.text = user;
  txtPassword.text = pass;

  function btnLogin.onClick()
    local function isVpnUsed()
      import "java.net.NetworkInterface"
      import "java.util.Collections"
      import "java.util.Enumeration"
      import "java.util.Iterator"
      local nlp= NetworkInterface.getNetworkInterfaces();
      if (nlp~=nil) then
        local it = Collections.list(nlp).iterator();
        while (it.hasNext()) do
          local nlo = it.next();
          if (nlo.isUp() && nlo.getInterfaceAddresses().size() ~= 0) then
            if ((tostring(nlo):find("tun0")) or (tostring(nlo):find("ppp0"))) then
              return true
            end
          end
        end
        return false
      end
    end
    local y=pcall(function()
      local ti=Ticker()
      ti.Period=100
      ti.start()
      ti.onTick=function()
        pcall(function()
          if isVpnUsed() then
            if w==nil then
              --print('以开启,退出程序')
              w=0
              task(500,function()--必须要延迟退出程序，我这里是延迟500毫秒也就是0.5秒。
                os.exit()--退出程序。          --如果你不延迟的话，就直接显示不了信息。
                ti.stop()--退出程序时停止计时器。
                activity.finish()--关闭当前页面。
              end)
            end
           else
            if w==nil then
              -- print('未开启抓包')
              w=0
            end
            --[[
        事件可放这里面
        但要打印的最好别放这里，这里是循环，一直检测的
        或者你也可以在软件启动时检测一次
        在这里添加  ti.stop()  就只检测一次，不是循环检测
        --我已经控制打印消息了，望悉知
       
        ]]--
          end
        end)
      end
      function onDestroy()
        ti.stop()
      end
    end)
    local username = txtUsername.text
    local password = txtPassword.text

    import "android.provider.Settings$Secure"
    local uuid = Secure.getString(activity.getContentResolver(), Secure.ANDROID_ID)
    if username =="" && password =="" then

      txtUsername.setError("Username cannot be empty")
      txtPassword.setError("password cannot be empty")

     elseif username =="" then
      txtUsername.setError("Please enter password")

     else if password =="" then
        txtPassword.setError("Please enter password")


       else
        dl=ProgressDialog.show(activity,nil,'Please wait!')
        dl.show()
        Http.post("https://grehan77.000webhostapp.com/login.php","username="..username.."&password="..password.."&uuid="..uuid,nil,"utf8",nil,function(code,body,cookie,header)



          if code == 200 then
            if body:match("Login success") then
              local pref = activity.getSharedPreferences("LieShooter", Context.MODE_PRIVATE)
              local save = pref.edit()
              save.putString("username", username)
              save.putString("password", password)
              save.commit()
              log=true
              userlogged= username
              useruid=uuid
              HomeLY()

             elseif body:match("wrong username") then

              dl.dismiss()
              Toast.makeText(activity, "wrong username and password",Toast.LENGTH_SHORT).show()
             elseif body:match("Device changed") then
              dl.dismiss()
              Toast.makeText(activity, "device has changed",Toast.LENGTH_SHORT).show()
             elseif body:match("inmaintanance")
              dl.dismiss()
              Toast.makeText(activity, "SERVER  IS IN MAINTANANCE",Toast.LENGTH_SHORT).show()
             elseif body:match ("key expired")
              dl.dismiss()
              Toast.makeText(activity, "key expired",Toast.LENGTH_SHORT).show()


             else
              dl.dismiss()
              Toast.makeText(activity, "Login failed!",Toast.LENGTH_SHORT).show()

            end
           else
            dl.dismiss()
            Toast.makeText(activity, "Can't connect to server!",Toast.LENGTH_SHORT).show()
          end


        end);
      end
    end
  end







end
activity.setTheme(R.AndLua5)
activity.actionBar.hide()
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
activity.setRequestedOrientation(1);

splash={
  LinearLayout;
  layout_height="fill";
  layout_width="fill";
  orientation="vertical";
  backgroundColor = "0xFF212121";
  {
    LinearLayout;
    gravity="center";
    layout_width="wrap";
    layout_height="50dp";
  };
  {
    LinearLayout,
    layout_height = "25%h",
    layout_width = "wrap"
  };
  {
    TextView,
    gravity="center",
    layout_gravity="center",
    text = " GREHAN ",
    layout_height = "wrap",
    layout_width = "wrap",
    id="rexx";
    textColor = "0xffffffff",
    textSize = "50sp",
  };
  {
    LinearLayout;
    gravity="center";
    layout_width="match_parent";
    layout_height="match_parent";
    orientation="vertical";
    gravity="bottom";

    {
      TextView;
      id="";
      textSize="13.5sp";
      layout_height="wrap";
      gravity="center";
      layout_gravity="center";
      text="Use your own ANTIBAN !";
      textColor="0xFFFFFFFF";
      backgroundColor="0xFF1C82FF";
      layout_width="60%w";
      Typeface=Typeface.defaultFromStyle(Typeface.BOLD);
    };
    {
      ProgressBar;
      layout_gravity="center";
      visibility="visible";
      layout_width="99.5%w";
      style="?android:attr/progressBarStyleHorizontal";
      id="pstatus";
      layout_height="wrap";
      scaleY="1.5";
      layout_marginTop="20dp";
    };
  };
};
activity.setContentView(loadlayout(splash))


dialog= ProgressDialog(this)
dialog.setProgressStyle(ProgressDialog.STYLE_SPINNER)
dialog.setMessage("Checking app version...")
dialog.setCancelable(false)
dialog.setCanceledOnTouchOutside(false)
dialog.show()


rexx.setTypeface(Typeface.createFromFile(activity.getLuaDir("res/rub.ttf")))


function increase(i)
  pstatus.incrementProgressBy(2)
  pstatus.incrementSecondaryProgressBy(40)
  if i=="2" then

    local function isVpnUsed()
      import "java.net.NetworkInterface"
      import "java.util.Collections"
      import "java.util.Enumeration"
      import "java.util.Iterator"
      local nlp= NetworkInterface.getNetworkInterfaces();
      if (nlp~=nil) then
        local it = Collections.list(nlp).iterator();
        while (it.hasNext()) do
          local nlo = it.next();
          if (nlo.isUp() && nlo.getInterfaceAddresses().size() ~= 0) then
            if ((tostring(nlo):find("tun0")) or (tostring(nlo):find("ppp0"))) then
              return true
            end
          end
        end
        return false
      end
    end
    local y=pcall(function()
      local ti=Ticker()
      ti.Period=100
      ti.start()
      ti.onTick=function()
        pcall(function()
          if isVpnUsed() then
            if w==nil then

              print('TURN OFF UR VPN')
              w=0
              task(500,function()
                os.exit()
                ti.stop()
                activity.finish()
              end)
            end
           else
            if w==nil then


              w=0
            end


          end
        end)
      end
      function onDestroy()
        ti.stop()
      end
    end)
    local socket = require("socket")

    local test = socket.tcp()
    test:settimeout(1000)

    local testResult = test:connect("www.google.com", 80)

    if (testResult == nil) then

      Toast.makeText(activity, "check your internet connection",Toast.LENGTH_SHORT).show()

      os.exit()


    end




    Http.post("https://grehan77.000webhostapp.com/splash.php","username=",nil,"utf8",nil,function(code,body,cookie,header)
      if not(body:match("53412357")) then

        log=false

        dialog = AlertDialog.Builder(this).setTitle("Update Required").setCancelable(false).setMessage("Join our Telegram channel to get the updated version of this apk").setPositiveButton("OK", {
          onClick = function(v)
            os.exit()
          end

        }).setNeutralButton("Join", {
          onClick = function(v)
            url = "tg://resolve?domain=Grehan_Hacks"
            activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
            activity.finish()
          end

        }).show()
        dialog.setMessage("Join our Telegram channel to get the updated version of this apk")


        CircleButton2(dialog.getWindow(), 1726291003, 15, 4294967295)
        import("android.text.SpannableString")
        import("android.text.style.ForegroundColorSpan")
        import("android.text.Spannable")
        texttitle.setSpan(ForegroundColorSpan(4288806143), 0, #texttitle, Spannable.SPAN_EXCLUSIVE_INCLUSIVE)
        dialog.setTitle(texttitle)
        dialog.setMessage("Join our Telegram channel to get the updated version of this apk")
        return








      end

    end)
   elseif i=="50" then
    dialog. dismiss ()
    LoginLY()

  end
end
function load()
  require "import"
  for i=1,100 do

    Thread.sleep(40)
    call("increase",tostring(i))
  end
end
thread(load)



function HomeLY()
  import "home"

  import "floatW"
  import "floatI"



  dl.dismiss()
  local username=userlogged
  local uuid=useruid


  host = "https://grehan77.000webhostapp.com"
  local a=0
  local tt=Ticker()
  tt.start()
  tt.onTick=function()
    a=a+1
    if a==5 then


      tt.stop()
    end
  end
  if log== false then
    os.exit()
   else
  end
  connect = Http.post(host.."/expcheck.php", "&username=" ..username,nil, function(code,body,cookie,header,content)
    local socket = require("socket")

    local test = socket.tcp()
    test:settimeout(1000)

    local testResult = test:connect("www.google.com", 80)

    if not(testResult == nil) then
      expDateX.setText((body))

     else
      expDateX.setText(("waiting for internet "))
    end



  end)
  activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
  activity.setContentView(loadlayout(home))
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFF212121);

  appName.setTypeface(Typeface.DEFAULT_BOLD)
  txtStart.setTypeface(Typeface.DEFAULT_BOLD)
  txtStop.setTypeface(Typeface.DEFAULT_BOLD)
  txtDataInfo.setTypeface(Typeface.DEFAULT_BOLD)

  if Settings.canDrawOverlays(activity) then
   else
    intent=Intent("android.settings.action.MANAGE_OVERLAY_PERMISSION");
    intent.setData(Uri.parse("package:" .. this.getPackageName())); this.startActivity(intent);
  end


  t3.setText (username)

  if t3.Text==" Fuckoff crackers" then
    os.exit()

  end
  icon = {
    LinearLayout,
    layout_width = "wrap",
    padding = "1dp",
    layout_height = "wrap",
    {
      LinearLayout,
      layout_width = "wrap",
      Orientation = "horizontal",
      layout_height = "wrap",
      {
        ImageView,
        padding = "-3dp",
        layout_width = "50dp",
        id = "Win_minWindow",
        src = "pro2.png",
        layout_height = "50dp"
      }
    }
  }

  LayoutVIP = activity.getSystemService(Context.WINDOW_SERVICE)
  HasFocus = false
  WmHz = WindowManager.LayoutParams()
  if Build.VERSION.SDK_INT >= 26 then
    WmHz.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
   else
    WmHz.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
  end
  import("android.graphics.PixelFormat")
  WmHz.format = PixelFormat.RGBA_8888
  WmHz.flags = WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
  WmHz.gravity = Gravity.CENTER | Gravity.CENTER
  WmHz.x = 0
  WmHz.y = 0
  WmHz.width = WindowManager.LayoutParams.WRAP_CONTENT
  WmHz.height = WindowManager.LayoutParams.WRAP_CONTENT
  mainWindow = loadlayout(floatW)
  minWindow = loadlayout(icon)
  isMax = true
  function btnMinimizeW.onClick()
    if isMax == false then
      isMax = true
      LayoutVIP.removeView(minWindow)
      LayoutVIP.addView(mainWindow, WmHz)
     else
      isMax = false
      LayoutVIP.removeView(mainWindow)
      LayoutVIP.addView(minWindow, WmHz)
    end
  end
  function btnMenuCheatHidden.onClick()
    if isMax == false then
      isMax = true
      LayoutVIP.removeView(minWindow)
      LayoutVIP.addView(mainWindow, WmHz)
     else
      isMax = false
      LayoutVIP.removeView(mainWindow)
      LayoutVIP.addView(minWindow, WmHz)
    end
  end
  function Win_minWindow.onClick(v)
    if isMax == false then
      isMax = true
      LayoutVIP.removeView(minWindow)
      LayoutVIP.addView(mainWindow, WmHz)
     else
      isMax = false
      LayoutVIP.removeView(mainWindow)
      LayoutVIP.addView(minWindow, WmHz)
    end
  end
  function float_ly.OnTouchListener(v, event)
    if event.getAction() == MotionEvent.ACTION_DOWN then
      firstX = event.getRawX()
      firstY = event.getRawY()
      wmX = WmHz.x
      wmY = WmHz.y
     elseif event.getAction() == MotionEvent.ACTION_MOVE then
      WmHz.x = wmX + (event.getRawX() - firstX)
      WmHz.y = wmY + (event.getRawY() - firstY)
      LayoutVIP.updateViewLayout(mainWindow, WmHz)
     elseif event.getAction() == MotionEvent.ACTION_UP then
    end
    return true
  end
  function Win_minWindow.OnTouchListener(v, event)
    if event.getAction() == MotionEvent.ACTION_DOWN then
      firstX = event.getRawX()
      firstY = event.getRawY()
      wmX = WmHz.x
      wmY = WmHz.y
     elseif event.getAction() == MotionEvent.ACTION_MOVE then
      WmHz.x = wmX + (event.getRawX() - firstX)
      WmHz.y = wmY + (event.getRawY() - firstY)
      LayoutVIP.updateViewLayout(minWindow, WmHz)
     elseif event.getAction() == MotionEvent.ACTION_UP then
    end
    return false
  end
  speedv1 = {
    LinearLayout,
    layout_width = "50dp",
    layout_height = "50dp",
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/spdx.png",
      id = "Speedv1ON",
      layout_height = "50dp"
    },
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/spd_x.png",
      id = "Speedv1OFF",
      layout_height = "50dp"
    }
  }
  FlashSpeed1 = activity.getSystemService(Context.WINDOW_SERVICE)
  HasFocus = false
  FloatFlashAh = WindowManager.LayoutParams()
  if Build.VERSION.SDK_INT >= 26 then
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
   else
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
  end
  import("android.graphics.PixelFormat")
  FloatFlashAh.format = PixelFormat.RGBA_8888
  FloatFlashAh.x = 0
  FloatFlashAh.y = 0
  FloatFlashAh.flags = WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
  FloatFlashAh.gravity = Gravity.CENTER | Gravity.CENTER
  FloatFlashAh.width = WindowManager.LayoutParams.WRAP_CONTENT
  FloatFlashAh.height = WindowManager.LayoutParams.WRAP_CONTENT
  FlashV1Icon = loadlayout(speedv1)
  OpenF1 = false
  function Speedv1ON.OnTouchListener(A0_29, A1_30)
    if OpenF1 == false then
      if A1_30.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_30.getRawX()
        firstY = A1_30.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_30.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_30.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_30.getRawY() - firstY)
        FlashSpeed1.updateViewLayout(FlashV1Icon, FloatFlashAh)
       elseif A1_30.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end

  function Speedv1OFF.OnTouchListener(A0_31, A1_32)
    if OpenF1 == false then
      if A1_32.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_32.getRawX()
        firstY = A1_32.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_32.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_32.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_32.getRawY() - firstY)
        FlashSpeed1.updateViewLayout(FlashV1Icon, FloatFlashAh)
       elseif A1_32.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end




  function flash1.OnCheckedChangeListener()
    if flash1.Checked then
      FlashSpeed1.addView(FlashV1Icon, FloatFlashAh)

     else
      FlashSpeed1.removeView(FlashV1Icon)
    end
  end




  speedv2 = {
    LinearLayout,
    layout_width = "50dp",
    layout_height = "50dp",
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/spd2x.png",
      id = "Speedv2ON",
      layout_height = "50dp"
    },
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/spd_2x.png",
      id = "Speedv2OFF",
      layout_height = "50dp"
    }
  }
  FlashSpeed2 = activity.getSystemService(Context.WINDOW_SERVICE)
  HasFocus = false
  FloatFlashAh = WindowManager.LayoutParams()
  if Build.VERSION.SDK_INT >= 26 then
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
   else
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
  end
  import("android.graphics.PixelFormat")
  FloatFlashAh.format = PixelFormat.RGBA_8888
  FloatFlashAh.x = 0
  FloatFlashAh.y = 0
  FloatFlashAh.flags = WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
  FloatFlashAh.gravity = Gravity.CENTER | Gravity.CENTER
  FloatFlashAh.width = WindowManager.LayoutParams.WRAP_CONTENT
  FloatFlashAh.height = WindowManager.LayoutParams.WRAP_CONTENT
  FlashV2Icon = loadlayout(speedv2)
  OpenF1 = false
  function Speedv2ON.OnTouchListener(A0_29, A1_30)
    if OpenF1 == false then
      if A1_30.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_30.getRawX()
        firstY = A1_30.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_30.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_30.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_30.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(FlashV2Icon, FloatFlashAh)
       elseif A1_30.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end

  function Speedv2OFF.OnTouchListener(A0_31, A1_32)
    if OpenF1 == false then
      if A1_32.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_32.getRawX()
        firstY = A1_32.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_32.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_32.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_32.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(FlashV2Icon, FloatFlashAh)
       elseif A1_32.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end


  function flash2.OnCheckedChangeListener()
    if flash2.Checked then
      FlashSpeed2.addView(FlashV2Icon, FloatFlashAh)

     else
      FlashSpeed2.removeView(FlashV2Icon)
    end
  end

  para1 = {
    LinearLayout,
    layout_width = "50dp",
    layout_height = "50dp",
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/para1on.png",
      id = "para1on",
      layout_height = "50dp"
    },
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/para1of.png",
      id = "para1of",
      layout_height = "50dp"
    }
  }
  FlashSpeed2 = activity.getSystemService(Context.WINDOW_SERVICE)
  HasFocus = false
  FloatFlashAh = WindowManager.LayoutParams()
  if Build.VERSION.SDK_INT >= 26 then
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
   else
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
  end
  import("android.graphics.PixelFormat")
  FloatFlashAh.format = PixelFormat.RGBA_8888
  FloatFlashAh.x = 0
  FloatFlashAh.y = 0
  FloatFlashAh.flags = WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
  FloatFlashAh.gravity = Gravity.CENTER | Gravity.CENTER
  FloatFlashAh.width = WindowManager.LayoutParams.WRAP_CONTENT
  FloatFlashAh.height = WindowManager.LayoutParams.WRAP_CONTENT
  para1Icon = loadlayout(para1)
  OpenF1 = false
  function para1on.OnTouchListener(A0_29, A1_30)
    if OpenF1 == false then
      if A1_30.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_30.getRawX()
        firstY = A1_30.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_30.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_30.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_30.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(para1Icon, FloatFlashAh)
       elseif A1_30.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end

  function para1of.OnTouchListener(A0_31, A1_32)
    if OpenF1 == false then
      if A1_32.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_32.getRawX()
        firstY = A1_32.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_32.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_32.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_32.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(para1Icon, FloatFlashAh)
       elseif A1_32.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end


  function fastpara1.OnCheckedChangeListener()
    if fastpara1.Checked then
      FlashSpeed2.addView(para1Icon, FloatFlashAh)

     else
      FlashSpeed2.removeView(para1Icon)
    end
  end
  para2 = {
    LinearLayout,
    layout_width = "50dp",
    layout_height = "50dp",
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/para2on.png",
      id = "para2on",
      layout_height = "50dp"
    },
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/paraoff2.png",
      id = "para2of",
      layout_height = "50dp"
    }
  }
  FlashSpeed2 = activity.getSystemService(Context.WINDOW_SERVICE)
  HasFocus = false
  FloatFlashAh = WindowManager.LayoutParams()
  if Build.VERSION.SDK_INT >= 26 then
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
   else
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
  end
  import("android.graphics.PixelFormat")
  FloatFlashAh.format = PixelFormat.RGBA_8888
  FloatFlashAh.x = 0
  FloatFlashAh.y = 0
  FloatFlashAh.flags = WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
  FloatFlashAh.gravity = Gravity.CENTER | Gravity.CENTER
  FloatFlashAh.width = WindowManager.LayoutParams.WRAP_CONTENT
  FloatFlashAh.height = WindowManager.LayoutParams.WRAP_CONTENT
  para2Icon = loadlayout(para2)
  OpenF1 = false
  function para2on.OnTouchListener(A0_29, A1_30)
    if OpenF1 == false then
      if A1_30.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_30.getRawX()
        firstY = A1_30.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_30.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_30.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_30.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(para2Icon, FloatFlashAh)
       elseif A1_30.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end

  function para2of.OnTouchListener(A0_31, A1_32)
    if OpenF1 == false then
      if A1_32.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_32.getRawX()
        firstY = A1_32.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_32.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_32.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_32.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(para2Icon, FloatFlashAh)
       elseif A1_32.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end



  function fastpara2.OnCheckedChangeListener()
    if fastpara2.Checked then
      FlashSpeed2.addView(para2Icon, FloatFlashAh)

     else
      FlashSpeed2.removeView(para2Icon)
    end
  end
  para3= {
    LinearLayout,
    layout_width = "50dp",
    layout_height = "50dp",
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/para3on.png",
      id = "para3on",
      layout_height = "50dp"
    },
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/para3off.png",
      id = "para3of",
      layout_height = "50dp"
    }
  }
  FlashSpeed2 = activity.getSystemService(Context.WINDOW_SERVICE)
  HasFocus = false
  FloatFlashAh = WindowManager.LayoutParams()
  if Build.VERSION.SDK_INT >= 26 then
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
   else
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
  end
  import("android.graphics.PixelFormat")
  FloatFlashAh.format = PixelFormat.RGBA_8888
  FloatFlashAh.x = 0
  FloatFlashAh.y = 0
  FloatFlashAh.flags = WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
  FloatFlashAh.gravity = Gravity.CENTER | Gravity.TOP
  FloatFlashAh.width = WindowManager.LayoutParams.WRAP_CONTENT
  FloatFlashAh.height = WindowManager.LayoutParams.WRAP_CONTENT
  para3Icon = loadlayout(para3)
  OpenF1 = false
  function para3on.OnTouchListener(A0_29, A1_30)
    if OpenF1 == false then
      if A1_30.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_30.getRawX()
        firstY = A1_30.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_30.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_30.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_30.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(para3Icon, FloatFlashAh)
       elseif A1_30.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end

  function para3of.OnTouchListener(A0_31, A1_32)
    if OpenF1 == false then
      if A1_32.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_32.getRawX()
        firstY = A1_32.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_32.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_32.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_32.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(para3Icon, FloatFlashAh)
       elseif A1_32.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end


  function fastpara3.OnCheckedChangeListener()
    if fastpara3.Checked then
      FlashSpeed2.addView(para3Icon, FloatFlashAh)

     else
      FlashSpeed2.removeView(para3Icon)
    end
  end

  flyman= {
    LinearLayout,
    layout_width = "50dp",
    layout_height = "50dp",
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/flyon.png",
      id = "flyon",
      layout_height = "50dp"
    },
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/flyoff.png",
      id = "flyof",
      layout_height = "50dp"
    }
  }
  FlashSpeed2 = activity.getSystemService(Context.WINDOW_SERVICE)
  HasFocus = false
  FloatFlashAh = WindowManager.LayoutParams()
  if Build.VERSION.SDK_INT >= 26 then
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
   else
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
  end
  import("android.graphics.PixelFormat")
  FloatFlashAh.format = PixelFormat.RGBA_8888
  FloatFlashAh.x = 0
  FloatFlashAh.y = 0
  FloatFlashAh.flags = WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
  FloatFlashAh.gravity = Gravity.CENTER | Gravity.CENTER
  FloatFlashAh.width = WindowManager.LayoutParams.WRAP_CONTENT
  FloatFlashAh.height = WindowManager.LayoutParams.WRAP_CONTENT
  flyIcon = loadlayout(flyman)
  OpenF1 = false
  function flyon.OnTouchListener(A0_29, A1_30)
    if OpenF1 == false then
      if A1_30.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_30.getRawX()
        firstY = A1_30.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_30.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_30.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_30.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(flyIcon, FloatFlashAh)
       elseif A1_30.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end

  function flyof.OnTouchListener(A0_31, A1_32)
    if OpenF1 == false then
      if A1_32.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_32.getRawX()
        firstY = A1_32.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_32.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_32.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_32.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(flyIcon, FloatFlashAh)
       elseif A1_32.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end


  function skyfly.OnCheckedChangeListener()
    if skyfly.Checked then
      FlashSpeed2.addView(flyIcon, FloatFlashAh)

     else
      FlashSpeed2.removeView(flyIcon)
    end
  end

  carfly= {
    LinearLayout,
    layout_width = "50dp",
    layout_height = "50dp",
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/jeep.png",
      id = "caron",
      layout_height = "50dp"
    },
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/jeep.png",
      id = "carof",
      layout_height = "50dp"
    }
  }
  FlashSpeed2 = activity.getSystemService(Context.WINDOW_SERVICE)
  HasFocus = false
  FloatFlashAh = WindowManager.LayoutParams()
  if Build.VERSION.SDK_INT >= 26 then
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
   else
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
  end
  import("android.graphics.PixelFormat")
  FloatFlashAh.format = PixelFormat.RGBA_8888
  FloatFlashAh.x = 0
  FloatFlashAh.y = 0
  FloatFlashAh.flags = WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
  FloatFlashAh.gravity = Gravity.CENTER | Gravity.CENTER
  FloatFlashAh.width = WindowManager.LayoutParams.WRAP_CONTENT
  FloatFlashAh.height = WindowManager.LayoutParams.WRAP_CONTENT
  carflyIcon = loadlayout(carfly)
  OpenF1 = false
  function caron.OnTouchListener(A0_29, A1_30)
    if OpenF1 == false then
      if A1_30.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_30.getRawX()
        firstY = A1_30.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_30.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_30.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_30.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(carflyIcon, FloatFlashAh)
       elseif A1_30.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end

  function carof.OnTouchListener(A0_31, A1_32)
    if OpenF1 == false then
      if A1_32.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_32.getRawX()
        firstY = A1_32.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_32.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_32.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_32.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(carflyIcon, FloatFlashAh)
       elseif A1_32.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end


  function carfl.OnCheckedChangeListener()
    if carfl.Checked then
      FlashSpeed2.addView(carflyIcon, FloatFlashAh)
      print("car fly on")
     else
      FlashSpeed2.removeView(carflyIcon)
    end
  end

  reload= {
    LinearLayout,
    layout_width = "50dp",
    layout_height = "50dp",
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/uammoon.png",
      id = "uammon",
      layout_height = "50dp"
    },
    {
      ImageView,
      layout_width = "80dp",
      src = "res/drawable/uammooff.png",
      id = "uammoff",
      layout_height = "50dp"
    }
  }
  FlashSpeed2 = activity.getSystemService(Context.WINDOW_SERVICE)
  HasFocus = false
  FloatFlashAh = WindowManager.LayoutParams()
  if Build.VERSION.SDK_INT >= 26 then
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
   else
    FloatFlashAh.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
  end
  import("android.graphics.PixelFormat")
  FloatFlashAh.format = PixelFormat.RGBA_8888
  FloatFlashAh.x = 0
  FloatFlashAh.y = 0
  FloatFlashAh.flags = WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
  FloatFlashAh.gravity = Gravity.CENTER | Gravity.CENTER
  FloatFlashAh.width = WindowManager.LayoutParams.WRAP_CONTENT
  FloatFlashAh.height = WindowManager.LayoutParams.WRAP_CONTENT
  reloadIcon = loadlayout(reload)
  OpenF1 = false
  function uammon.OnTouchListener(A0_29, A1_30)
    if OpenF1 == false then
      if A1_30.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_30.getRawX()
        firstY = A1_30.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_30.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_30.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_30.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(reloadIcon, FloatFlashAh)
       elseif A1_30.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end

  function uammoff.OnTouchListener(A0_31, A1_32)
    if OpenF1 == false then
      if A1_32.getAction() == MotionEvent.ACTION_DOWN then
        firstX = A1_32.getRawX()
        firstY = A1_32.getRawY()
        wmX = FloatFlashAh.x
        wmY = FloatFlashAh.y
       elseif A1_32.getAction() == MotionEvent.ACTION_MOVE then
        FloatFlashAh.x = wmX + (A1_32.getRawX() - firstX)
        FloatFlashAh.y = wmY + (A1_32.getRawY() - firstY)
        FlashSpeed2.updateViewLayout(reloadIcon, FloatFlashAh)
       elseif A1_32.getAction() == MotionEvent.ACTION_UP then
      end
     else
    end
    return false
  end


  function uammo.OnCheckedChangeListener()
    if uammo.Checked then
      FlashSpeed2.addView(reloadIcon, FloatFlashAh)
      print("car fly on")
     else
      FlashSpeed2.removeView(reloadIcon)
    end
  end



  import "expdate"
  task(1000, function()
    if os.execute("su") == true then
      Mode="root"
      stats.Text = "Root"
      stats.textColor = 0xCEFFFFFF
     else

      stats.Text = "Non Root"
      stats.textColor = 0xCEFFFFFF
    end
  end
  )


  function tele_gram.onClick
    url = "tg://resolve?domain=Grehan_Hacks"
    activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
  end

  import "frame"
  import "draw"
  function btnStart.onClick()
    if log==true then
      DrawSwitch=true
      LayoutVIP.addView(mainWindow, WmHz)
     else
      os.exit()
    end
  end

  function btnStop.onClick()
    DrawSwitch=false
    if isMax == false then

      isMax = true

      LayoutVIP.removeView(minWindow)
     else
      LayoutVIP.removeView(mainWindow)
    end
  end






  CircleButton6 (border, 0xFF212121, 30,0xFFFFFFFF)
  CircleButton (win_mainview,0x00000000, 20,0xFFFFFFFF)
  CircleButton (m416, 0xFF1C82FF, 10,0xFF1C82FF)
  CircleButton (m16, 0xFF1C82FF, 10,0xFF1C82FF)
  CircleButton (mini, 0xFF1C82FF, 10,0xFF1C82FF)
  CircleButton (dp, 0xFF1C82FF, 10,0xFF1C82FF)
  CircleButton (m7, 0xFF1C82FF, 10,0xFF1C82FF)
  CircleButton (scarl, 0xFF1C82FF, 10,0xFF1C82FF)
  CircleButton (awm, 0xFF1C82FF, 10,0xFF1C82FF)
  CircleButton (m249, 0xFF1C82FF, 10,0xFF1C82FF)
  CircleButton (qbz, 0xFF1C82FF, 10,0xFF1C82FF)
  CircleButton (groza, 0xFF1C82FF, 10,0xFF1C82FF)
  CircleButton6 (fps90, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (fps120, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (norecoil, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (noshake, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (smallcrosshair, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (blacksky, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (blackbody, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (antenna, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (nightmod, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (desertmod, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (uammo, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (autosniper, 0x00000000, 20,0xFF7E8590)

  CircleButton6 (headshot1, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (headshot2, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (headshot3, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (flash1, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (flash2, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (flash3, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (flash4, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (flash5, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (flash6, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (flash7, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (magicbullet1, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (magicbullet2, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (aimbot, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (sitfly, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (xhit1, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (xhit2, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (fastscope, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (nofog, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (red, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (blue, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (green, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (cyan, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (purple, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (nogrs, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (notree, 0x00000000, 20,0xFF7E8590)

  CircleButton6 (view2, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (rainbow, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (fastpara1, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (fastpara2, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (fastpara3, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (standscp, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (sitscp, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (prnscp, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (spd, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (skyfly, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (carfl, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (fixstuck1, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (fixstuck2, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (longjump, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (fixping, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (fastcar, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (fastbullet, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (knockspeed, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (pronespeed, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (fastscope, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (slowmo, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (thirdparty, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (islndbyp, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (lbybypass, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (iptables, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (skyfly2, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (autodrive, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (disable, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (instanthit, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (logobyp, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (static, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (rainbowhit, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (sitgod, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (sitgodlow, 0x00000000, 20,0xFF7E8590)




  CircleButton6 (fps30, 0x00000000, 20,0xFF7E8590)
  CircleButton6 (fps60, 0x00000000, 20,0xFF7E8590)





  purple.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFF7A00FF,PorterDuff.Mode.SRC_ATOP));
  green.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFF00FF00,PorterDuff.Mode.SRC_ATOP));
  cyan.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFF00FFFF,PorterDuff.Mode.SRC_ATOP));
  red.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFFFF0000,PorterDuff.Mode.SRC_ATOP));
  nofog.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFFFFFFFF,PorterDuff.Mode.SRC_ATOP));
  blue.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFF0000FF,PorterDuff.Mode.SRC_ATOP));
  rainbow.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFFFFFFFF,PorterDuff.Mode.SRC_ATOP));








  menu1.textColor=0xFF1C82FF
  menu2.textColor=0xFFFFFFFF
  menu3.textColor=0xFFFFFFFF
  menu4.textColor=0xFFFFFFFF
  CircleButton(menu1,0x00000000,15,0xFF1C82FF)
  CircleButton(menu2,0x00000000,15,0xFFFFFFFF)
  CircleButton(menu3,0x00000000,15,0xFFFFFFFF)
  CircleButton(menu4,0x00000000,15,0xFFFFFFFF)
  pg.showPage(0)
  menu1.onClick=function()
    pg.showPage(0)
    CircleButton(menu1,0x00000000,15,0xFF1C82FF)
    CircleButton(menu2,0x00000000,15,0xFFFFFFFF)
    CircleButton(menu3,0x00000000,15,0xFFFFFFFF)
    CircleButton(menu4,0x00000000,15,0xFFFFFFFF) menu1.textColor=0xFF1C82FF
    menu2.textColor=0xFFFFFFFF
    menu3.textColor=0xFFFFFFFF
    menu4.textColor=0xFFFFFFFF

  end
  menu2.onClick=function()
    pg.showPage(1)
    CircleButton(menu1,0x00000000,15,0xFFFFFFFF)
    CircleButton(menu2,0x00000000,15,0xFF1C82FF)
    CircleButton(menu3,0x00000000,15,0xFFFFFFFF)
    CircleButton(menu4,0x00000000,15,0xFFFFFFFF) menu1.textColor=0xFFFFFFFF
    menu2.textColor=0xFF1C82FF
    menu3.textColor=0xFFFFFFFF
    menu4.textColor=0xFFFFFFFF
  end
  menu3.onClick=function()
    pg.showPage(2)
    CircleButton(menu1,0x00000000,15,0xFFFFFFFF)
    CircleButton(menu2,0x00000000,15,0xFFFFFFFF)
    CircleButton(menu3,0x00000000,15,0xFF1C82FF)
    CircleButton(menu4,0x00000000,15,0xFFFFFFFF) menu1.textColor=0xFFFFFFFF
    menu2.textColor=0xFFFFFFFF
    menu3.textColor=0xFF1C82FF
    menu4.textColor=0xFFFFFFFF
  end
  menu4.onClick=function()
    pg.showPage(3)
    CircleButton(menu1,0x00000000,15,0xFFFFFFFF)
    CircleButton(menu2,0x00000000,15,0xFFFFFFFF)
    CircleButton(menu3,0x00000000,15,0xFFFFFFFF)
    CircleButton(menu4,0x00000000,15,0xFF1C82FF) menu1.textColor=0xFFFFFFFF
    menu2.textColor=0xFFFFFFFF
    menu3.textColor=0xFFFFFFFF
    menu4.textColor=0xFF1C82FF
  end

  pg.addOnPageChangeListener{
    onPageScrolled=function(a,b,c)
    end,
    onPageSelected=function(page)
      if page==0 then
        CircleButton(menu1,0x00000000,15,0xFF1C82FF)
        CircleButton(menu2,0x00000000,15,0xFFFFFFFF)
        CircleButton(menu3,0x00000000,15,0xFFFFFFFF)
        CircleButton(menu4,0x00000000,15,0xFFFFFFFF)
        menu1.textColor=0xFF1C82FF
        menu2.textColor=0xFFFFFFFF
        menu3.textColor=0xFFFFFFFF
        menu4.textColor=0xFFFFFFFF

      end
      if page==1 then
        CircleButton(menu1,0x00000000,15,0xFFFFFFFF)
        CircleButton(menu2,0x00000000,15,0xFF1C82FF)
        CircleButton(menu3,0x00000000,15,0xFFFFFFFF)
        CircleButton(menu4,0x00000000,15,0xFFFFFFFF) menu1.textColor=0xFFFFFFFF

        menu1.textColor=0xFFFFFFFF
        menu2.textColor=0xFF1C82FF
        menu3.textColor=0xFFFFFFFF
        menu4.textColor=0xFFFFFFFF
      end
      if page==2 then
        CircleButton(menu1,0x00000000,15,0xFFFFFFFF)
        CircleButton(menu2,0x00000000,15,0xFFFFFFFF)
        CircleButton(menu3,0x00000000,15,0xFF1C82FF)
        CircleButton(menu4,0x00000000,15,0xFFFFFFFF) menu1.textColor=0xFFFFFFFF

        menu1.textColor=0xFFFFFFFF
        menu2.textColor=0xFFFFFFFF
        menu3.textColor=0xFF1C82FF
        menu4.textColor=0xFFFFFFFF

      end
      if page==3 then
        CircleButton(menu1,0x00000000,15,0xFFFFFFFF)
        CircleButton(menu2,0x00000000,15,0xFFFFFFFF)
        CircleButton(menu3,0x00000000,15,0xFFFFFFFF)
        CircleButton(menu4,0x00000000,15,0xFF1C82FF) menu1.textColor=0xFFFFFFFF

        menu1.textColor=0xFFFFFFFF
        menu2.textColor=0xFFFFFFFF
        menu3.textColor=0xFFFFFFFF
        menu4.textColor=0xFF1C82FF
      end
    end,
    onPageScrollStateChanged=function(state)
    end,}



  import "java.io.File"
  function run_cpp(file)
    if Mode=="root" then
      path=activity.getLuaDir(file)
      os.execute("su -c chmod 777 "..path)
      if pcall(function()Runtime.getRuntime().exec("su -c "..path)end) then

       else
        os.execute("rm -r "..Hz_C)
        --  print('Not found')

      end
     else
      path=activity.getLuaDir(file)
      os.execute("chmod 777 "..path)
      if pcall(function()Runtime.getRuntime().exec(""..path)end) then

       else
        os.execute("rm -r "..path)
        --  print('Not found')

      end
    end
  end
  function exec(cmd)
    local p=io.popen(string.format('%s',cmd))
    local s=p:read("*a")
    p:close()
    return s
  end
  crsh.onClick=function()
    if Mode=="root" then
      if packageName=="com.pubg.imobile" then
        if pcall(function() activity.getPackageManager().getPackageInfo("com.pubg.imobile",0) end) then
          exec("su -c chmod 000 /data/data/com.pubg.imobile/files/ano_tmp")
          Toast.makeText(activity, "Crash Fixed BGMI",Toast.LENGTH_SHORT).show()

         else
          Toast.makeText(activity, "BGMI is not installed",Toast.LENGTH_SHORT).show()
        end


       elseif packageName=="com.rekoo.pubgm" then

        if pcall(function() activity.getPackageManager().getPackageInfo("com.rekoo.pubgm",0) end) then
          exec("su -c chmod 000 /data/data/com.rekoo.pubgm/files/ano_tmp")

          -- LayoutVIP.addView(minWindow,WmHz)
          Toast.makeText(activity, "Crash Fixed Taiwan",Toast.LENGTH_SHORT).show()

         else
          Toast.makeText(activity, "Taiwan pubg is not installed",Toast.LENGTH_SHORT).show()

        end


       elseif packageName=="com.vng.pubgmobile" then
        if pcall(function() activity.getPackageManager().getPackageInfo("com.vng.pubgmobile",0) end) then
          exec("su -c chmod 000 /data/data/com.vng.pubgmobile/files/ano_tmp")

          -- LayoutVIP.addView(minWindow,WmHz)
          Toast.makeText(activity, "Crash Fixed Vietnam",Toast.LENGTH_SHORT).show()

         else
          Toast.makeText(activity, "Veitnam pubg is not installed",Toast.LENGTH_SHORT).show()

        end
       elseif packageName=="com.pubg.krmobile" then
        if pcall(function() activity.getPackageManager().getPackageInfo("com.pubg.krmobile",0) end) then
          exec("su -c chmod 000 /data/data/com.pubg.krmobile/files/ano_tmp")

          -- LayoutVIP.addView(minWindow,WmHz)
          Toast.makeText(activity, "Crash Fixed Korea",Toast.LENGTH_SHORT).show()

         else
          Toast.makeText(activity, "Korean pubg is not installed",Toast.LENGTH_SHORT).show()

        end



       elseif packageName=="com.tencent.ig" then
        if pcall(function() activity.getPackageManager().getPackageInfo("com.tencent.ig",0) end) then
          exec("su -c chmod 000 /data/data/com.tencent.ig/files/ano_tmp")

          -- LayoutVIP.addView(minWindow,WmHz)
          Toast.makeText(activity, "Crash Fixed Global",Toast.LENGTH_SHORT).show()

         else
          Toast.makeText(activity, "Global Pubg is not installed",Toast.LENGTH_SHORT).show()

        end


       else
        Toast.makeText(activity, "Game not selected",Toast.LENGTH_SHORT).show()

      end
     else
      Toast.makeText(activity, "Only for Root",Toast.LENGTH_SHORT).show()


    end
  end;

  btmenu.onClick=function()
    Toast.makeText(activity, "SOON",Toast.LENGTH_SHORT).show()

    if packageName=="com.pubg.imobile" then
      --    run_cpp("lib/1")
      --     Toast.makeText(activity, "BGMI Bullet Track On",Toast.LENGTH_SHORT).show()

     elseif packageName=="com.rekoo.pubgm" then
      --     Toast.makeText(activity, "TAIWAN Bullet Track On",Toast.LENGTH_SHORT).show()
      --      run_cpp("lib/2")
     elseif packageName=="com.vng.pubgmobile" then
      --      Toast.makeText(activity, "VEITNAM Comming Soon",Toast.LENGTH_SHORT).show()

     elseif packageName=="com.pubg.krmobile" then
      ---    Toast.makeText(activity, "KOREAN Bullet Track On",Toast.LENGTH_SHORT).show()
      --     run_cpp("lib/3")
     elseif packageName=="com.tencent.ig" then
      ---     Toast.makeText(activity, "GLOBAL Bullet Track On",Toast.LENGTH_SHORT).show()
      --   run_cpp("lib/4")
     else
      Toast.makeText(activity, "Game Not Selected",Toast.LENGTH_SHORT).show()

    end
  end;

  Dragbar3.setOnSeekBarChangeListener{
    onProgressChanged=function(view, Progres)
      if Progres==0 then
        speedadj.setText(" Speed : "..Progres)
        run_cpp ("lib/armfire 55660")
      end
      if Progres==1 then
        speedadj.setText(" Speed : "..Progres)
        run_cpp ("lib/armfire 55661")
      end
      if Progres==2 then
        speedadj.setText(" Speed : "..Progres)
        run_cpp ("lib/armfire 55662")
      end
      if Progres==3 then
        speedadj.setText(" Speed : "..Progres)
        run_cpp ("lib/armfire 55663")
      end
      if Progres==4 then
        speedadj.setText(" Speed : "..Progres)
        run_cpp ("lib/armfire 55664")
      end
      if Progres==5 then
        speedadj.setText(" Speed : "..Progres)
        run_cpp ("lib/armfire 55665")
      end
      if Progres==6 then
        speedadj.setText(" Speed : "..Progres)
        run_cpp ("lib/armfire 55666")
      end
      if Progres==7 then
        speedadj.setText(" Speed : "..Progres)
        run_cpp ("lib/armfire 55667")
      end
      if Progres==8 then
        speedadj.setText(" Speed : "..Progres)
        run_cpp ("lib/armfire 55668")
      end
      if Progres==9 then
        speedadj.setText(" Speed : "..Progres)
        run_cpp ("lib/armfire 55669")
      end
      if Progres==10 then
        speedadj.setText(" Speed : "..Progres)
        run_cpp ("lib/armfire 55670")
      end

    end
  }

  Dragbar2.setOnSeekBarChangeListener{
    onProgressChanged=function(view, Progres)
      if Progres==0 then
        wide.setText(" IPad View : "..Progres)
        run_cpp ("lib/armfire 100000")
      end
      if Progres==1 then
        wide.setText(" IPad View : "..Progres)
        run_cpp ("lib/armfire 5555")
      end
      if Progres==2 then
        wide.setText(" IPad View : "..Progres)
        run_cpp ("lib/armfire 6666")
      end
      if Progres==3 then
        wide.setText(" IPad View : "..Progres)
        run_cpp ("lib/armfire 7777")
      end
      if Progres==4 then
        wide.setText(" IPad View : "..Progres)
        run_cpp ("lib/armfire 8888")
      end
      if Progres==5 then
        wide.setText(" IPad View : "..Progres)
        run_cpp ("lib/armfire 9999")
      end
    end
  }



  function fps30.onClick(v)
    if fps30.checked then
      run_cpp ("lib/armfire 5")
    end
  end

  function fps60.onClick(v)
    if fps60.checked then

      run_cpp ("lib/armfire 6")
    end
  end

  function fps90.onClick(v)
    if fps90.checked then
      run_cpp ("lib/armfire 7")
    end
  end

  function fps120.onClick(v)
    if fps120.checked then
      run_cpp ("lib/armfire 8")
    end
  end

  function nofog.onClick(v)
    if nofog.checked then
      run_cpp ("lib/armfire 666")
    end
  end

  function red.onClick(v)
    if red.checked then
      run_cpp ("lib/armfire 10000")
    end
  end
  function blue.onClick(v)
    if blue.checked then
      run_cpp ("lib/armfire 999")
    end
  end
  function cyan.onClick(v)
    if cyan.checked then
      run_cpp ("lib/armfire 99999")
    end
  end

  function purple.onClick(v)
    if purple.checked then
      run_cpp ("lib/armfire 777")
    end
  end

  function green.onClick(v)
    if green.checked then
      run_cpp ("lib/armfire 888")
    end
  end
  function rainbow.onClick(v)
    if rainbow.checked then
      coloor="shit";
      run_cpp ("lib/armfire 48")
    end
  end
  function disable.onClick(v)
    if disable.checked then
      run_cpp ("lib/armfire 555")
      if coloor=="shit" then
        run_cpp ("lib/armfire 47")

      end
    end
  end


  function logobyp.OnCheckedChangeListener()
    if logobyp.Checked then
      run_cpp ("lib/armfire0 745")
      Toast.makeText(activity, "Bypass Activated",Toast.LENGTH_SHORT).show()

     else

      Toast.makeText(activity, "Bypass De-Activated",Toast.LENGTH_SHORT).show()
    end
  end

  function lbybypass.OnCheckedChangeListener()
    if lbybypass.Checked then
      -- run_cpp ("lib/armfire 770")
      --   Toast.makeText(activity, "bypass On",Toast.LENGTH_SHORT).show()

     else
      --    run_cpp ("lib/armfire 770")
      --     Toast.makeText(activity, "bypass Off",Toast.LENGTH_SHORT).show()
    end
  end

  function islndbyp.OnCheckedChangeListener()
    if islndbyp.Checked then
   --   run_cpp ("lib/armfire0 746")
      Toast.makeText(activity, "Island bypass On",Toast.LENGTH_SHORT).show()

     else

      Toast.makeText(activity, "Island bypass Off",Toast.LENGTH_SHORT).show()
    end
  end

  function noshake.OnCheckedChangeListener()
    if noshake.Checked then
      run_cpp ("lib/armfire1 61")
      Toast.makeText(activity, "No Shake On",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire1 62")
      Toast.makeText(activity, "No Shake Off",Toast.LENGTH_SHORT).show()
    end
  end

  function norecoil.OnCheckedChangeListener()
    if norecoil.Checked then
      run_cpp ("lib/armfire1 57")
      Toast.makeText(activity, "No Recoil On",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire1 58")
      Toast.makeText(activity, "No Recoil Off",Toast.LENGTH_SHORT).show()
    end
  end


  function smallcrosshair.OnCheckedChangeListener()
    if smallcrosshair.Checked then
      run_cpp ("lib/armfire 33 ")
      Toast.makeText(activity, "Small Croshair on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 44")
      Toast.makeText(activity, "Small Croshair Off",Toast.LENGTH_SHORT).show()
    end
  end


  function blacksky.OnCheckedChangeListener()
    if blacksky.Checked then
      run_cpp ("lib/armfire1 63")
      Toast.makeText(activity, "blacksky on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire1 64")
      Toast.makeText(activity, "blacksky off",Toast.LENGTH_SHORT).show()
    end
  end


  function antenna.OnCheckedChangeListener()
    if antenna.Checked then
      run_cpp ("lib/armfire 587")
      Toast.makeText(activity, "Antenna on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 588")
      Toast.makeText(activity, "Antenna off",Toast.LENGTH_SHORT).show()
    end
  end


  function nightmod.OnCheckedChangeListener()
    if nightmod.Checked then
      run_cpp ("lib/armfire1 95")
      Toast.makeText(activity, "Nightmod on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire1 96")
      Toast.makeText(activity, "Nightmod off",Toast.LENGTH_SHORT).show()
    end
  end

  function nogrs.OnCheckedChangeListener()
    if nogrs.Checked then
      run_cpp ("lib/armfire1 67")
      Toast.makeText(activity, "No Grass on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire1 68")
      Toast.makeText(activity, "No Grass off",Toast.LENGTH_SHORT).show()
    end
  end

  function notree.OnCheckedChangeListener()
    if notree.Checked then
      run_cpp ("lib/armfire1 91")
      Toast.makeText(activity, "No Tree on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire1 92")
      Toast.makeText(activity, "No Tree off",Toast.LENGTH_SHORT).show()
    end
  end

  function desertmod.OnCheckedChangeListener()
    if desertmod.Checked then
      run_cpp ("lib/armfire 333")
      Toast.makeText(activity, "Desertmod on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 444")
      Toast.makeText(activity, "Desertmod off",Toast.LENGTH_SHORT).show()
    end
  end


  function blackbody.OnCheckedChangeListener()
    if blackbody.Checked then
      run_cpp ("lib/armfire1 103")
      Toast.makeText(activity, "Blackbody on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire1 104")
      Toast.makeText(activity, "Blackbody off",Toast.LENGTH_SHORT).show()
    end
  end

  uammon.setVisibility(View.GONE)
  function uammoff.onClick()
    uammoff.setVisibility(View.GONE)
    uammon.setVisibility(View.VISIBLE)
    Toast.makeText(activity, " Unlimited Ammo On", Toast.LENGTH_SHORT).show()
    run_cpp ("lib/mn")
  end

  function uammon.onClick()
    uammon.setVisibility(View.GONE)
    uammoff.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Unlimited Ammo Off", Toast.LENGTH_SHORT).show()
    run_cpp ("lib/mf")
  end



  function autosniper.OnCheckedChangeListener()
    if autosniper.Checked then
      run_cpp ("lib/sn")
      Toast.makeText(activity, "Auto Sniper on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/sf")
      Toast.makeText(activity, "Auto Sniper Off",Toast.LENGTH_SHORT).show()
    end
  end




  function autouammo.OnCheckedChangeListener()
    if autouammo.Checked then

      Toast.makeText(activity, "Auto Sniper on",Toast.LENGTH_SHORT).show()

     else

      Toast.makeText(activity, "Auto Sniper off",Toast.LENGTH_SHORT).show()
    end
  end



  function headshot1.OnCheckedChangeListener()
    if headshot1.Checked then
      run_cpp ("lib/armfire 8488")
      Toast.makeText(activity, "Headshot v1 on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 8489")
      Toast.makeText(activity, "Headshot v1 off",Toast.LENGTH_SHORT).show()
    end
  end


  function headshot2.OnCheckedChangeListener()
    if headshot2.Checked then
      run_cpp ("lib/armfire 85")
      Toast.makeText(activity, "Headshot V2 on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 84")
      Toast.makeText(activity, "Headshot V2 off",Toast.LENGTH_SHORT).show()
    end
  end


  function headshot3.OnCheckedChangeListener()
    if headshot3.Checked then
      run_cpp ("lib/armfire 8490")
      Toast.makeText(activity, "Headshot V3 on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 8491")
      Toast.makeText(activity, "Headshot V3 off",Toast.LENGTH_SHORT).show()
    end
  end


  function magicbullet1.OnCheckedChangeListener()
    if magicbullet1.Checked then
      run_cpp ("lib/armfire 89")
      Toast.makeText(activity, "Magic Bullet V1 on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 188")
      Toast.makeText(activity, "Magic Bullet V2 off",Toast.LENGTH_SHORT).show()
    end
  end


  function magicbullet2.OnCheckedChangeListener()
    if magicbullet2.Checked then
      run_cpp ("lib/armfire 8962")
      Toast.makeText(activity, "Magic Bullet V2 on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 8963")
      Toast.makeText(activity, "Magic Bullet V2 off",Toast.LENGTH_SHORT).show()
    end
  end


  function instanthit.OnCheckedChangeListener()
    if instanthit.Checked then
      run_cpp ("lib/armfire 93")
      Toast.makeText(activity, "InstantHit On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 92")
      Toast.makeText(activity, "InstantHit Off",Toast.LENGTH_SHORT).show()
    end
  end

  function aimbot.OnCheckedChangeListener()
    if aimbot.Checked then
      run_cpp ("lib/armfire 55555")
      Toast.makeText(activity, "Aimbot on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 66666")
      Toast.makeText(activity, "Aimbot off",Toast.LENGTH_SHORT).show()
    end
  end


  function xhit1.OnCheckedChangeListener()
    if xhit1.Checked then
      run_cpp ("lib/armfire 111")
      Toast.makeText(activity, "X Hit V1 on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 222")
      Toast.makeText(activity, "X Hit V1 off",Toast.LENGTH_SHORT).show()
    end
  end


  function xhit2.OnCheckedChangeListener()
    if xhit2.Checked then
      run_cpp ("lib/armfire1 97")
      Toast.makeText(activity, "X Hit V2 on",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire1 98")
      Toast.makeText(activity, "X Hit V2 off",Toast.LENGTH_SHORT).show()
    end
  end

  function static.OnCheckedChangeListener()
    if static.Checked then
      run_cpp ("lib/armfire 1189")
      Toast.makeText(activity, "Static hit On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 2290")
      Toast.makeText(activity, "Static hit Off",Toast.LENGTH_SHORT).show()
    end
  end

  function rainbowhit.OnCheckedChangeListener()
    if rainbowhit.Checked then

      --     run_cpp ("lib/armfire 50")
      Toast.makeText(activity, "Rainbow hit On",Tost.LENGTH_SHORT).show()

     else
      --     run_cpp ("lib/armfire 49")
      Toast.makeText(activity, "Rainbow hit Off",Toast.LENGTH_SHORT).show()
    end
  end

  function standscp.OnCheckedChangeListener()
    if standscp.Checked then
      Toast.makeText(activity, "Stand Scope on",Tost.LENGTH_SHORT).show()

      run_cpp ("lib/armfire1 107")

     else
      run_cpp ("lib/armfire1 108")
      Toast.makeText(activity, "Stand Scope off",Toast.LENGTH_SHORT).show()
    end
  end

  function sitscp.OnCheckedChangeListener()
    if sitscp.Checked then

      run_cpp ("lib/armfire 57")
      Toast.makeText(activity, "Sit Scope on",Tost.LENGTH_SHORT).show()


     else
      run_cpp ("lib/armfire 56")
      Toast.makeText(activity, "Sit Scope off",Toast.LENGTH_SHORT).show()
    end
  end

  function prnscp.OnCheckedChangeListener()
    if prnscp.Checked then
      run_cpp ("lib/armfire 155")
      Toast.makeText(activity, "Prone Scope on",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 54")
      Toast.makeText(activity, "Prone Scope off",Toast.LENGTH_SHORT).show()
    end
  end

  function sitfly.OnCheckedChangeListener()
    if sitfly.Checked then
      run_cpp ("lib/armfire 83")
      Toast.makeText(activity, "Sitfly on",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 82")
      Toast.makeText(activity, "Sitfly off",Toast.LENGTH_SHORT).show()
    end
  end


  function sitgod.OnCheckedChangeListener()
    if sitgod.Checked then
      run_cpp ("lib/armfire 831")
      Toast.makeText(activity, "God View On",Tost.LENGTH_SHORT).show()



     else

      run_cpp ("lib/armfire 821")
      Toast.makeText(activity, "God View Off",Tost.LENGTH_SHORT).show()

    end
  end

  function sitgodlow.OnCheckedChangeListener()
    if sitgodlow.Checked then

      run_cpp ("lib/armfire 841")
      Toast.makeText(activity, "God View Low on",Tost.LENGTH_SHORT).show()


     else
      run_cpp ("lib/armfire 851")
      Toast.makeText(activity, "God View Low off",Toast.LENGTH_SHORT).show()
    end
  end

  function fastscope.OnCheckedChangeListener()
    if fastscope.Checked then
      run_cpp ("lib/armfire 61")
      Toast.makeText(activity, "Fast Scope on",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 60")
      Toast.makeText(activity, "Fast Scope off",Toast.LENGTH_SHORT).show()
    end
  end


  function fixstuck1.OnCheckedChangeListener()
    if fixstuck1.Checked then
      run_cpp ("lib/armfire 199")
      Toast.makeText(activity, "Fix Stuck V1 On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 98")
      Toast.makeText(activity, "Fix Stuck V1 Off",Toast.LENGTH_SHORT).show()
    end
  end


  function fixstuck2.OnCheckedChangeListener()
    if fixstuck2.Checked then
      run_cpp ("lib/armfire 77777")
      Toast.makeText(activity, "Fix Stuck V2 On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 88888")
      Toast.makeText(activity, "Fix Stuck V2 Off",Toast.LENGTH_SHORT).show()
    end
  end

  carof.setVisibility(View.GONE)
  function caron.onClick()
    caron.setVisibility(View.GONE)
    carof.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Car Fly On", Toast.LENGTH_SHORT).show()
    Thread.sleep(4000)
    run_cpp ("lib/armfire 51")
  end

  function carof.onClick()
    carof.setVisibility(View.GONE)
    caron.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Car Fly On", Toast.LENGTH_SHORT).show()
    Thread.sleep(9000)
    run_cpp ("lib/armfire 51")
  end

  flyon.setVisibility(View.GONE)
  function flyon.onClick()
    flyon.setVisibility(View.GONE)
    flyof.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Sky Fly Off", Toast.LENGTH_SHORT).show()
    run_cpp ("lib/armfire 86")
  end

  function flyof.onClick()
    flyof.setVisibility(View.GONE)
    flyon.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Sky Fly On", Toast.LENGTH_SHORT).show()
    run_cpp ("lib/armfire 87")
  end

  Speedv1OFF.setVisibility(View.GONE)
  function Speedv1ON.onClick()
    Speedv1ON.setVisibility(View.GONE)
    Speedv1OFF.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Flash V1 On", Toast.LENGTH_SHORT).show()
    run_cpp ("lib/armfire 81")
  end

  function Speedv1OFF.onClick()
    Speedv1OFF.setVisibility(View.GONE)
    Speedv1ON.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Flash V1 Off", Toast.LENGTH_SHORT).show()
    run_cpp ("lib/armfire 80")
  end


  Speedv2OFF.setVisibility(View.GONE)
  function Speedv2ON.onClick()
    Speedv2ON.setVisibility(View.GONE)
    Speedv2OFF.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Flash V2 On", Toast.LENGTH_SHORT).show()
    run_cpp ("lib/armfire 79")
  end

  function Speedv2OFF.onClick()
    Speedv2OFF.setVisibility(View.GONE)
    Speedv2ON.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Flash V2 Off", Toast.LENGTH_SHORT).show()
    run_cpp ("lib/armfire 78")
  end

  para1on.setVisibility(View.GONE)
  function para1on.onClick()
    para1on.setVisibility(View.GONE)
    para1of.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Parachute V1 Off", Toast.LENGTH_SHORT).show()
    run_cpp ("lib/armfire 64")
  end



  function para1of.onClick()
    para1of.setVisibility(View.GONE)
    para1on.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Parachute V1 On", Toast.LENGTH_SHORT).show()
    run_cpp ("lib/armfire 65")

  end


  para2on.setVisibility(View.GONE)
  function para2on.onClick()
    para2on.setVisibility(View.GONE)
    para2of.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Parachute V2 Off", Toast.LENGTH_SHORT).show()

    run_cpp ("lib/armfire 62")
  end

  function para2of.onClick()
    para2of.setVisibility(View.GONE)
    para2on.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Parachute V2 On", Toast.LENGTH_SHORT).show()
    run_cpp ("lib/armfire 63")

  end





  para3on.setVisibility(View.GONE)
  function para3on.onClick()
    para3on.setVisibility(View.GONE)
    para3of.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Parachute V3 Off", Toast.LENGTH_SHORT).show()
    run_cpp ("lib/armfire 638")
  end



  function para3of.onClick()
    para3of.setVisibility(View.GONE)
    para3on.setVisibility(View.VISIBLE)
    Toast.makeText(activity, "Parachute V3 On", Toast.LENGTH_SHORT).show()
    run_cpp ("lib/armfire 637")
  end



  function thirdparty.OnCheckedChangeListener()
    if thirdparty.Checked then
      run_cpp ("lib/armfire 190")
      Toast.makeText(activity, "ACTIVATED",Toast.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 190")
      Toast.makeText(activity, "DE-ACTIVATED",Toast.LENGTH_SHORT).show()
    end
  end

  function knockspeed.OnCheckedChangeListener()
    if knockspeed.Checked then
      run_cpp ("lib/armfire 67")
      Toast.makeText(activity, "Knock Speed On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 166")
      Toast.makeText(activity, "Knock Speed Off",Toast.LENGTH_SHORT).show()
    end
  end

  function pronespeed.OnCheckedChangeListener()
    if pronespeed.Checked then
      run_cpp ("lib/armfire 67")
      Toast.makeText(activity, "Prone Speed On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 166")
      Toast.makeText(activity, "Prone Speed Off",Toast.LENGTH_SHORT).show()
    end
  end


  function skyfly2.OnCheckedChangeListener()
    if skyfly2.Checked then
      run_cpp ("lib/armfire 95")
      Toast.makeText(activity, "Stable Fly On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 94")
      Toast.makeText(activity, "Stable Fly Off",Toast.LENGTH_SHORT).show()
    end
  end


  function fastbullet.OnCheckedChangeListener()
    if fastbullet.Checked then
      run_cpp ("lib/armfire1 105")
      Toast.makeText(activity, "Fast Bullet On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire1 106")
      Toast.makeText(activity, "Fast Bullet Off",Toast.LENGTH_SHORT).show()
    end
  end


  function longjump.OnCheckedChangeListener()
    if longjump.Checked then
      run_cpp ("lib/armfire1 77")
      Toast.makeText(activity, "Long Jump On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire1 78")
      Toast.makeText(activity, "Long Jump Off",Toast.LENGTH_SHORT).show()
    end
  end

  function autodrive.OnCheckedChangeListener()
    if autodrive.Checked then
      run_cpp ("lib/armfire1 101")
      Toast.makeText(activity, "Auto Drive On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire1 102")
      Toast.makeText(activity, "Auto Drive Off",Toast.LENGTH_SHORT).show()
    end
  end


  function fastcar.OnCheckedChangeListener()
    if fastcar.Checked then
      run_cpp ("lib/armfire1 73")
      Toast.makeText(activity, "Fast Car On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire1 74")
      Toast.makeText(activity, "Fast Car Off",Toast.LENGTH_SHORT).show()
    end
  end


  function fixping.OnCheckedChangeListener()
    if fixping.Checked then
      run_cpp ("lib/armfire1 85")
      Toast.makeText(activity, "Fix Ping Activated",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire1 86")
      Toast.makeText(activity, " Fix Ping Deactivated",Toast.LENGTH_SHORT).show()
    end
  end

  function slowmo.OnCheckedChangeListener()
    if slowmo.Checked then
      run_cpp ("lib/armfire 97")
      Toast.makeText(activity, "Slowmotion On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 96")
      Toast.makeText(activity, "Slowmotion Off",Toast.LENGTH_SHORT).show()
    end
  end

  function flash3.OnCheckedChangeListener()
    if flash3.Checked then
      run_cpp ("lib/armfire 177")
      Toast.makeText(activity, "Flash V3 On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 76")
      Toast.makeText(activity, "Flash V3 Off",Toast.LENGTH_SHORT).show()
    end
  end

  function flash4.OnCheckedChangeListener()
    if flash4.Checked then
      run_cpp ("lib/armfire 75")
      Toast.makeText(activity, "Flash v4 On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 74")
      Toast.makeText(activity, "Flash v4 Off",Toast.LENGTH_SHORT).show()
    end
  end
  function flash5.OnCheckedChangeListener()
    if flash5.Checked then
      run_cpp ("lib/armfire 73")
      Toast.makeText(activity, "Flash v5 On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 72")
      Toast.makeText(activity, "Flash v5 Off",Toast.LENGTH_SHORT).show()
    end
  end
  function flash6.OnCheckedChangeListener()
    if flash6.Checked then
      run_cpp ("lib/armfire 71")
      Toast.makeText(activity, "Flash v6 On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 70")
      Toast.makeText(activity, "Flash v6 Off",Toast.LENGTH_SHORT).show()
    end
  end
  function flash7.OnCheckedChangeListener()
    if flash7.Checked then
      run_cpp ("lib/armfire 69")
      Toast.makeText(activity, "Flash v7 On",Tost.LENGTH_SHORT).show()

     else
      run_cpp ("lib/armfire 68")
      Toast.makeText(activity, "Flash v7 Off",Toast.LENGTH_SHORT).show()
    end
  end



  function glacier.OnCheckedChangeListener()
    if glacier.checked then
      run_cpp("lib/suck 101")
      os.remove(activity.getLuaDir("lib/suck 101"))
     else
      run_cpp("lib/suck 100")
      os.remove(activity.getLuaDir("lib/suck 102"))
    end
  end

  function lizard.OnCheckedChangeListener()
    if lizard.checked then
      run_cpp("lib/suck 102")
      os.remove(activity.getLuaDir("lib/suck 102"))
     else
      run_cpp("lib/suck 100")
      os.remove(activity.getLuaDir("lib/suck 100"))
    end
  end

  function thefool.OnCheckedChangeListener()
    if thefool.checked then
      run_cpp("lib/suck 103")
      os.remove(activity.getLuaDir("lib/suck 103"))
     else
      run_cpp("lib/suck 100")
      os.remove(activity.getLuaDir("lib/suck 100"))
    end
  end

  function wanderer.OnCheckedChangeListener()
    if wanderer.checked then
      run_cpp("lib/suck 104")
      os.remove(activity.getLuaDir("lib/suck 104"))
     else
      run_cpp("lib/suck 100")
      os.remove(activity.getLuaDir("lib/suck 100"))
    end
  end

  function pumkin.OnCheckedChangeListener()
    if pumkin.checked then
      run_cpp("lib/suck 122")
      os.remove(activity.getLuaDir("lib/suck 122"))
     else
      run_cpp("lib/suck 120")
      os.remove(activity.getLuaDir("lib/suck 120"))
    end
  end

  function operation.OnCheckedChangeListener()
    if operation.checked then
      run_cpp("lib/suck 121")
      os.remove(activity.getLuaDir("lib/suck 122"))
     else
      run_cpp("lib/suck 120")
      os.remove(activity.getLuaDir("lib/suck 120"))
    end
  end






end