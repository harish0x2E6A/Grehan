
import "android.util.DisplayMetrics"
dm = DisplayMetrics();
activity.getWindowManager().getDefaultDisplay().getRealMetrics(dm);
function ScreenHeight()
  local a = dm.widthPixels;
  local b = dm.heightPixels;
  if tonumber(a)>tonumber(b) then
    b=a
   else
    b=b
  end
  return tonumber(b)
end
function ScreenWidth()
  local a = dm.widthPixels;
  local b = dm.heightPixels;
  if tonumber(a)>tonumber(b) then
    a=b
   else
    a=a
  end
  return tonumber(a)
end
import "android.provider.Settings"
import "android.content.*"
import "android.net.*"
local function DeterminePermissionFloatingW()
  if (Build.VERSION.SDK_INT >= 23 and not Settings.canDrawOverlays(this)) then
    return false
   elseif Build.VERSION.SDK_INT < 23 then
    return true
   else
    return true
  end
end
if not DeterminePermissionFloatingW() then
  import "android.provider.Settings"
  AlertDialog.Builder()
  .setTitle("No floating window permission！")
  .setMessage("It is detected that you have not given permission to the floating window，Please click to authorize。")
  .setPositiveButton("Authorization",{onClick=function(v)
      intent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION);
      intent.setData(Uri.parse("package:" .. activity.getPackageName()));
      activity.startActivityForResult(intent, 100);
      os.exit()
    end})
  .show()
end


import "android.content.Context"
$wmManagers = activity.getSystemService(Context.WINDOW_SERVICE)
$wmParam = WindowManager.LayoutParams()
if tonumber(Build.VERSION.SDK) >= 26 then
  wmParam.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
 else
  wmParam.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
end


import("android.graphics.PixelFormat")
wmParam.format = PixelFormat.RGBA_8888

WindowManager_FLAG_FILL=WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN| WindowManager.LayoutParams.FLAG_FULLSCREEN| WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS

wmParam.flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
| WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
| WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
| WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED--硬件加速
| WindowManager_FLAG_FILL

wmParam.gravity = Gravity.LEFT | Gravity.TOP
wmParam.width = ScreenHeight()
wmParam.height = -1
window=LinearLayout(this)
wmManagers.addView(window,wmParam)


import "frame"
import "android.graphics.Paint$Cap"
import "android.animation.ArgbEvaluator"
import "android.graphics.*"

local scale = activity.getResources().getDisplayMetrics().scaledDensity
dp1=scale + 1.5
dp2=dp1*70


BoxBrush=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setStyle(Paint.Style.STROKE)
.setStrokeWidth(2)

NumberOfPeopleBrush1=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setARGB(255, 0, 250, 0)

NumberOfPeopleBrush2=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setColor(0xFFFFFFFF)
.setTextAlign(Paint.Align.CENTER)
.setTextSize(50)
.setFakeBoldText(true)
.setShadowLayer(10,0,2,0xFFFF0000)

RayBrush=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setStrokeWidth(2)
.setColor(0xC4FF0000)

BackEnemyBrush1=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)

BackEnemyBrush2=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setStyle(Paint.Style.STROKE)
.setStrokeWidth(2)

AgainstTheEnemyText=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize(30)
.setFakeBoldText(true)
.setTextAlign(Paint.Align.CENTER)

--Path1=Path()

--rectf=RectF()

--PathBrush=Paint()
--.setAntiAlias(true)
--.setColor(0xBB000000)

PathBox=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setColor(0xBB000000)

TeamIDBOX=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
--.setStyle(Paint.Style.STROKE)
--.setStrokeWidth(2)
.setColor(0xFF0000FF)

DistanceBrush=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize(20)
.setFakeBoldText(true)
.setColor(0xFFFFD400)
.setTextAlign(Paint.Align.RIGHT)

CampBrush=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize(20)
.setFakeBoldText(true)
.setColor(0xFFFFFFFF)

MotionBrush=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize(20)
.setFakeBoldText(true)
.setColor(0xFFFFFFFF)
.setTextAlign(Paint.Align.CENTER)

ManMachineBrush=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize(17)
.setFakeBoldText(true)
.setTextAlign(Paint.Align.CENTER)

PlayerNAME=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize(17)
.setFakeBoldText(true)
.setTextAlign(Paint.Align.CENTER)
.setColor(0xFFFFFFFF)

BloodStripBrush1=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setStyle(Paint.Style.STROKE)
.setStrokeWidth(2)
.setColor(0x00FFFFFF)

BloodStripBrush2=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setStyle(Paint.Style.STROKE)
.setStrokeWidth(9)

BloodStripBrush3=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setFakeBoldText(true)
.setTextSize(20)
.setColor(0xffffffff)

width=ScreenHeight()
height=ScreenWidth()

AmsmT=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setColor(0xffffffff)
.setTextAlign(Paint.Align.CENTER)
.setTextSize(25)
.setFakeBoldText(true)

