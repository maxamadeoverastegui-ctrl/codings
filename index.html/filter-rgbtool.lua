--RGB adjustment tool v1.2 by khaver

obs = obslua

SETTING_TOOLS = 'tools'
SETTING_BYPASS = 'bypass'
SETTING_CENTERX = 'centerx'
SETTING_CENTERY = 'centery'
SETTING_NORM = 'norm'
SETTING_GRAD = 'grad'
SETTING_TEXT = 'text'
SETTING_METER = 'meter'
SETTING_MOVE = 'move'
SETTING_R = 'col_r'
SETTING_G = 'col_g'
SETTING_B = 'col_b'
SETTING_E = 'col_e'
SETTING_GAMMA = 'gamma'
SETTING_AUTO = 'autowb'
SETTING_AUTOLM = 'autolm'

TEXT_R = 'R'
TEXT_G = 'G'
TEXT_B = 'B'
TEXT_E = 'Exposure'
TEXT_GAMMA = 'Gamma'
TEXT_TOOLS = 'Show Tools'
TEXT_BYPASS = 'Bypass RGB/Exposure/Gamma Adjustments'
TEXT_CENTERX = 'Center X'
TEXT_CENTERY = 'Center Y'
TEXT_NORM = 'Normalize Gradient'
TEXT_TEXT = 'Note:'
TEXT_METER = 'Meter Level'
TEXT_MOVE = 'Move Graph'
TEXT_GRAD = 'Show Gradient'
TEXT_AUTO = 'Auto Lock'
TEXT_AUTOLM = 'Lock to Luma(unchecked)/Meter(checked) level'

source_info = {}
source_info.id = 'filter-rgbtool'
source_info.type = obs.OBS_SOURCE_TYPE_FILTER
source_info.output_flags = obs.OBS_SOURCE_VIDEO

image = "data:image/png;base64,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"

-- Returns the description displayed in the Scripts window
function script_description()
  return [[<center><img width=160 height=90 src=']] .. image .. [['/><br>Filter by khaver - v1.2</br><br/><hr/></center>]]
end

function script_load(settings)
  obs.obs_register_source(source_info)
end

function set_render_size(filter)
    target = obs.obs_filter_get_target(filter.source)

    local width, height
    if target == nil then
        width = 0
        height = 0
    else
        width = obs.obs_source_get_base_width(target)
        height = obs.obs_source_get_base_height(target)
    end

    filter.width = width
    filter.height = height
end

function set_visibility(props, property, settings)
	local tools = obs.obs_data_get_bool(settings, "tools")
	obs.obs_property_set_visible(obs.obs_properties_get(props, "move"), tools==true)
	obs.obs_property_set_visible(obs.obs_properties_get(props, "centerx"), tools==true)
	obs.obs_property_set_visible(obs.obs_properties_get(props, "centery"), tools==true)
	obs.obs_property_set_visible(obs.obs_properties_get(props, "autowb"), tools==true)
	obs.obs_property_set_visible(obs.obs_properties_get(props, "autolm"), tools==true)
	obs.obs_property_set_visible(obs.obs_properties_get(props, "text"), tools==true)
	obs.obs_property_set_visible(obs.obs_properties_get(props, "meter"), tools==true)
	obs.obs_property_set_visible(obs.obs_properties_get(props, "grad"), tools==true)
	obs.obs_property_set_visible(obs.obs_properties_get(props, "norm"), tools==true)

	return true
end

source_info.get_name = function()
    return "RGB Ajustment Tool"
end

source_info.create = function(settings, source)

    local filter = {}
	filter.width = 0
	filter.height = 0
    filter.source = source

	set_render_size(filter)

    obs.obs_enter_graphics()
    --local effect_path = script_path() .. 'filter-rgbtool.fx'
    --filter.effect = obs.gs_effect_create_from_file(effect_path, nil)
    filter.effect = obs.gs_effect_create(shader, nil, nil)


	if filter.effect ~= nil then
		filter.params = {}
        filter.params.tools = obs.gs_effect_get_param_by_name(filter.effect, 'tools')
        filter.params.bypass = obs.gs_effect_get_param_by_name(filter.effect, 'bypass')
        filter.params.autowb = obs.gs_effect_get_param_by_name(filter.effect, 'autowb')
        filter.params.autolm = obs.gs_effect_get_param_by_name(filter.effect, 'autolm')
        filter.params.centerx = obs.gs_effect_get_param_by_name(filter.effect, 'centerx')
        filter.params.centery = obs.gs_effect_get_param_by_name(filter.effect, 'centery')
        filter.params.norm = obs.gs_effect_get_param_by_name(filter.effect, 'norm')
        filter.params.grad = obs.gs_effect_get_param_by_name(filter.effect, 'grad')
		filter.params.text = obs.gs_effect_get_param_by_name(filter.effect, 'text')
        filter.params.meter = obs.gs_effect_get_param_by_name(filter.effect, 'meter')
        filter.params.move = obs.gs_effect_get_param_by_name(filter.effect, 'move')
        filter.params.col_r = obs.gs_effect_get_param_by_name(filter.effect, 'col_r')
        filter.params.col_g = obs.gs_effect_get_param_by_name(filter.effect, 'col_g')
        filter.params.col_b = obs.gs_effect_get_param_by_name(filter.effect, 'col_b')
        filter.params.col_e = obs.gs_effect_get_param_by_name(filter.effect, 'col_e')
        filter.params.gamma = obs.gs_effect_get_param_by_name(filter.effect, 'gamma')
        filter.params.width = obs.gs_effect_get_param_by_name(filter.effect, 'width')
        filter.params.height = obs.gs_effect_get_param_by_name(filter.effect, 'height')
	end

    obs.obs_leave_graphics()

    if filter.effect == nil then
        source_info.destroy(filter)
        return nil
    end

    source_info.update(filter, settings)
    return filter
end

source_info.destroy = function(filter)
    if filter.effect ~= nil then
        obs.obs_enter_graphics()
        obs.gs_effect_destroy(filter.effect)
        obs.obs_leave_graphics()
    end
	filter = nil
end

source_info.get_width = function(filter)
    return filter.width
end

source_info.get_height = function(filter)
    return filter.height
end

source_info.get_properties = function(settings)
    props = obs.obs_properties_create()

    obs.obs_properties_add_bool(props, SETTING_BYPASS, TEXT_BYPASS)
    local p = obs.obs_properties_add_bool(props, SETTING_TOOLS, TEXT_TOOLS)

	obs.obs_property_set_modified_callback(p, set_visibility)

    obs.obs_properties_add_float_slider(props, SETTING_R, TEXT_R, -1023.0, 1023.0, 0.1)
    obs.obs_properties_add_float_slider(props, SETTING_G, TEXT_G, -1023.0, 1023.0, 0.1)
    obs.obs_properties_add_float_slider(props, SETTING_B, TEXT_B, -1023.0, 1023.0, 0.1)
    obs.obs_properties_add_float_slider(props, SETTING_E, TEXT_E, -10.0, 10.0, 0.001)
    obs.obs_properties_add_float_slider(props, SETTING_GAMMA, TEXT_GAMMA, -3.0, 3.0, 0.001)
    obs.obs_properties_add_float_slider(props, SETTING_MOVE, TEXT_MOVE, -0.5, 0.5, 0.001)
    obs.obs_properties_add_float_slider(props, SETTING_CENTERX, TEXT_CENTERX, 0.0, 1.0, 0.0001)
    obs.obs_properties_add_float_slider(props, SETTING_CENTERY, TEXT_CENTERY, 0.0, 1.0, 0.0001)
    obs.obs_properties_add_bool(props, SETTING_AUTO, TEXT_AUTO)
    obs.obs_properties_add_bool(props, SETTING_AUTOLM, TEXT_AUTOLM)
	obs.obs_properties_add_text(props, SETTING_TEXT, TEXT_TEXT, obs.OBS_TEXT_DEFAULT)
    obs.obs_properties_add_int_slider(props, SETTING_METER, TEXT_METER, 0, 1023, 1)
    obs.obs_properties_add_bool(props, SETTING_GRAD, TEXT_GRAD)
    obs.obs_properties_add_bool(props, SETTING_NORM, TEXT_NORM)

    return props
end

source_info.get_defaults = function(settings)
    obs.obs_data_set_default_bool(settings, SETTING_TOOLS, false)
    obs.obs_data_set_default_bool(settings, SETTING_AUTO, false)
    obs.obs_data_set_default_bool(settings, SETTING_AUTOLM, false)
    obs.obs_data_set_default_bool(settings, SETTING_BYPASS, false)
    obs.obs_data_set_default_double(settings, SETTING_CENTERX, 0.5)
    obs.obs_data_set_default_double(settings, SETTING_CENTERY, 0.5)
    obs.obs_data_set_default_bool(settings, SETTING_NORM, false)
    obs.obs_data_set_default_bool(settings, SETTING_GRAD, false)
    obs.obs_data_set_default_string(settings, SETTING_TEXT, 'Meter level of 418 = neutral gray')
    obs.obs_data_set_default_int(settings, SETTING_METER, 418)
    obs.obs_data_set_default_double(settings, SETTING_MOVE, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_R, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_G, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_B, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_E, 0.0)
    obs.obs_data_set_default_double(settings, SETTING_GAMMA, 0.0)
end

source_info.update = function(filter, settings)
	gamma = obs.obs_data_get_double(settings, SETTING_GAMMA)
 	if gamma < 0.0 then
		gamma = (gamma * -1.0) + 1.0
	else
		gamma = 1.0 / (gamma + 1.0)
	end

    filter.tools = obs.obs_data_get_bool(settings, SETTING_TOOLS)
    filter.autowb = obs.obs_data_get_bool(settings, SETTING_AUTO)
    filter.autolm = obs.obs_data_get_bool(settings, SETTING_AUTOLM)
    filter.bypass = obs.obs_data_get_bool(settings, SETTING_BYPASS)
    filter.centerx = obs.obs_data_get_double(settings, SETTING_CENTERX)
    filter.centery = obs.obs_data_get_double(settings, SETTING_CENTERY)
    filter.norm = obs.obs_data_get_bool(settings, SETTING_NORM)
    filter.grad = obs.obs_data_get_bool(settings, SETTING_GRAD)
	filter.meter = obs.obs_data_get_int(settings, SETTING_METER)
    filter.move = obs.obs_data_get_double(settings, SETTING_MOVE)
    filter.col_r = obs.obs_data_get_double(settings, SETTING_R)
    filter.col_g = obs.obs_data_get_double(settings, SETTING_G)
    filter.col_b = obs.obs_data_get_double(settings, SETTING_B)
    filter.col_e = obs.obs_data_get_double(settings, SETTING_E)
    filter.gamma = gamma --obs.obs_data_get_double(settings, SETTING_GAMMA)

	set_render_size(filter)

end

source_info.video_render = function(filter)

  if not obs.obs_source_process_filter_begin(filter.source, obs.GS_RGBA, obs.OBS_ALLOW_DIRECT_RENDERING) then return end


    obs.gs_effect_set_bool(filter.params.tools, filter.tools)
    obs.gs_effect_set_bool(filter.params.autowb, filter.autowb)
    obs.gs_effect_set_bool(filter.params.autolm, filter.autolm)
    obs.gs_effect_set_bool(filter.params.bypass, filter.bypass)
    obs.gs_effect_set_float(filter.params.centerx, filter.centerx)
    obs.gs_effect_set_float(filter.params.centery, filter.centery)
    obs.gs_effect_set_bool(filter.params.norm, filter.norm)
    obs.gs_effect_set_bool(filter.params.grad, filter.grad)
    obs.gs_effect_set_int(filter.params.meter, filter.meter)
    obs.gs_effect_set_float(filter.params.move, filter.move)
    obs.gs_effect_set_float(filter.params.col_r, filter.col_r)
    obs.gs_effect_set_float(filter.params.col_g, filter.col_g)
    obs.gs_effect_set_float(filter.params.col_b, filter.col_b)
    obs.gs_effect_set_float(filter.params.col_e, filter.col_e)
    obs.gs_effect_set_float(filter.params.gamma, filter.gamma)
	obs.gs_effect_set_int(filter.params.width, filter.width)
	obs.gs_effect_set_int(filter.params.height, filter.height)

    obs.obs_source_process_filter_end(filter.source, filter.effect, filter.width, filter.height)
end

source_info.video_tick = function(filter, seconds)
    set_render_size(filter)
end

shader = [[
//RGB Adjustment Tool filter v1.1 by khaver

uniform float4x4 ViewProj;
uniform texture2d image;

uniform bool tools;
uniform bool autowb;
uniform bool autolm;
uniform bool bypass;
uniform float centerx;
uniform float centery;
uniform bool norm;
uniform bool grad;
uniform int meter;
uniform float move;
uniform float col_r;
uniform float col_g;
uniform float col_b;
uniform float col_e;
uniform float gamma;
uniform int width;
uniform int height;

#define EPSILON 0.0 //1e-10

#define RED   float3(1.0, 0.0, 0.0)
#define GREEN float3(0.0, 1.0, 0.0)
#define BLUE  float3(0.0, 0.0, 1.0)
#define BLACK float3(0.0, 0.0, 0.0)
#define WHITE float3(1.0,1.0,1.0)
#define GRAY float3(0.46,0.46,0.46)
#define YELLOW float3(1.0,1.0,0.0)
#define CYAN float3(0.0,1.0,1.0)
#define MAGENTA float3(1.0,0.0,1.0)

#define CONST_00    0.755
#define CONST_01    0.75
#define CONST_02    0.25
#define CONST_03    0.245

#define CONST_11    0.525+(0.005/OAR)
#define CONST_12    0.475-(0.005/OAR)
#define CONST_13    0.475
#define CONST_14    0.4875
#define CONST_15    0.5
#define CONST_16    0.5125
#define CONST_17    0.525

#define comax(COLOUR) (max (max (COLOUR.r, COLOUR.g), COLOUR.b))
#define comin(COLOUR) (min (min (COLOUR.r, COLOUR.g), COLOUR.b))

sampler_state textureSampler {
    Filter    = Linear;
    AddressU  = Clamp;
    AddressV  = Clamp;
};

struct VertDataIn {
    float4 pos : POSITION;
    float2 uv  : TEXCOORD0;
};

struct VertDataOut {
    float4 pos : POSITION;
    float2 uv  : TEXCOORD0;
};

VertDataOut VSDefault(VertDataIn v_in)
{
    VertDataOut vert_out;
    vert_out.pos = mul(float4(v_in.pos.xyz, 1.0), ViewProj);
    vert_out.uv  = v_in.uv;
    return vert_out;
}

float4 PassThrough(VertDataOut v_in) : TARGET
{
	float3 Black = BLACK;
	float3 White = WHITE;
	float3 Red = RED;
	float3 Green = GREEN;
	float3 Blue = BLUE;
	float3 Gray = float3(0.3,0.3,0.3);
	float mlevel = float(meter) / 1023.0;
	float colr = col_r / 1023.0;
	float colg = col_g / 1023.0;
	float colb = col_b / 1023.0;
	float Width;
	float Height;

   float2 uv = v_in.uv;
   float OAR = width / height;
   float pix1X = 1.0 / width;
   float pix1Y = 1.0 / height;
   float pix2X = (1.0 / width) * 1.5;
   float pix2Y = (1.0 / height) * 1.5;
   float pix3X = (1.0 / width) * 2.0;
   float pix3Y = (1.0 / height) * 2.0;

   float4 orig = image.Sample(textureSampler, uv);

   float3 coladd = (bypass) ? float3(0.0,0.0,0.0) : float3(colr,colg,colb);
   coladd += float3(1.0,1.0,1.0);
   coladd.r = colr > 1.0 ? coladd.r : pow(coladd.r, 10.0);
   coladd.g = colg > 1.0 ? coladd.g : pow(coladd.g, 10.0);
   coladd.b = colb > 1.0 ? coladd.r : pow(coladd.b, 10.0);

   float2 mouse = float2(centerx, 1.0-centery);
   float3 cc1 = image.Sample(textureSampler, mouse).rgb;								//m
   if (tools || autowb) {
   cc1 += image.Sample(textureSampler, float2(mouse.x - pix3X, mouse.y - pix3Y)).rgb;	//a
   cc1 += image.Sample(textureSampler, float2(mouse.x, mouse.y - pix3Y)).rgb;			//b
   cc1 += image.Sample(textureSampler, float2(mouse.x + pix3X, mouse.y - pix3Y)).rgb;	//c
   cc1 += image.Sample(textureSampler, float2(mouse.x - pix2X, mouse.y - pix2Y)).rgb;	//d
   cc1 += image.Sample(textureSampler, float2(mouse.x, mouse.y - pix2Y)).rgb;			//e
   cc1 += image.Sample(textureSampler, float2(mouse.x + pix2X, mouse.y - pix2Y)).rgb;	//f
   cc1 += image.Sample(textureSampler, float2(mouse.x - pix1X, mouse.y - pix1Y)).rgb;	//g
   cc1 += image.Sample(textureSampler, float2(mouse.x, mouse.y - pix2Y)).rgb;			//h
   cc1 += image.Sample(textureSampler, float2(mouse.x + pix1X, mouse.y - pix1Y)).rgb;	//i
   cc1 += image.Sample(textureSampler, float2(mouse.x - pix3X, mouse.y)).rgb;			//j
   cc1 += image.Sample(textureSampler, float2(mouse.x - pix2X, mouse.y)).rgb;			//k
   cc1 += image.Sample(textureSampler, float2(mouse.x - pix1X, mouse.y)).rgb;			//l
   cc1 += image.Sample(textureSampler, float2(mouse.x + pix1X, mouse.y)).rgb;			//n
   cc1 += image.Sample(textureSampler, float2(mouse.x + pix2X, mouse.y)).rgb;			//o
   cc1 += image.Sample(textureSampler, float2(mouse.x + pix3X, mouse.y)).rgb;			//p
   cc1 += image.Sample(textureSampler, float2(mouse.x - pix1X, mouse.y + pix1Y)).rgb;	//q
   cc1 += image.Sample(textureSampler, float2(mouse.x, mouse.y + pix1Y)).rgb;			//r
   cc1 += image.Sample(textureSampler, float2(mouse.x + pix1X, mouse.y + pix1Y)).rgb;	//s
   cc1 += image.Sample(textureSampler, float2(mouse.x - pix2X, mouse.y + pix2Y)).rgb;	//t
   cc1 += image.Sample(textureSampler, float2(mouse.x, mouse.y + pix2Y)).rgb;			//u
   cc1 += image.Sample(textureSampler, float2(mouse.x + pix2X, mouse.y + pix2Y)).rgb;	//v
   cc1 += image.Sample(textureSampler, float2(mouse.x - pix3X, mouse.y + pix3Y)).rgb;	//w
   cc1 += image.Sample(textureSampler, float2(mouse.x, mouse.y + pix3Y)).rgb;			//x
   cc1 += image.Sample(textureSampler, float2(mouse.x + pix3X, mouse.y + pix3Y)).rgb;	//y
   cc1 /= float3(25.0,25.0,25.0);
	}
   float3 weights = float3(0.2125, 0.7154, 0.0721);
   float dd = dot(cc1, weights);
   float3 clevel = float3(dd,dd,dd);
   float level = clevel.x;
	float pp = pow(2.0, col_e);
   float3 lvls = orig.rgb;
	if (!bypass) {
			cc1 *= coladd;
			cc1 *= float3(pp,pp,pp);
			cc1 = pow(cc1, float3(gamma,gamma,gamma));
			dd = dot(cc1, weights);
			clevel = float3(dd,dd,dd);
			level = clevel.x;
			lvls *= coladd;
			lvls *= float3(pp,pp,pp);
			lvls = pow(lvls, float3(gamma,gamma,gamma));
			lvls = lerp(orig.rgb, lvls, orig.a);
		if (autowb) {
			if (autolm) level = mlevel;
			if (cc1.r == 0.0) cc1.r = 0.00001;
			if (cc1.g == 0.0) cc1.g = 0.00001;
			if (cc1.b == 0.0) cc1.b = 0.00001;
			float rminus = level / cc1.r;
			float gminus = level / cc1.g;
			float bminus = level / cc1.b;
			cc1.r *= rminus;
			cc1.g *= gminus;
			cc1.b *= bminus;
			lvls.r *= rminus;
			lvls.g *= gminus;
			lvls.b *= bminus;
			lvls = lerp(orig.rgb, lvls, orig.a);
		}
   }
   cc1 = saturate(cc1);
   lvls = saturate(lvls);
   lvls = lerp(orig.rgb, lvls, orig.a);
   float cmin = comin(cc1);
   float cmax = comax(cc1);
   float rg = abs(cc1.r - cc1.g);
   float rb = abs(cc1.r - cc1.b);
   float gb = abs(cc1.g - cc1.b);
   if (rg < 0.004) {Red = GRAY; Green = GRAY; }
   if (rb < 0.004) {Red = GRAY; Blue = GRAY; }
   if (gb < 0.004) {Green = GRAY; Blue = GRAY; }
   float3 meter = GRAY;
   float cmult = 1.0 / cmax;
   float cdelta = (rg + rb + gb) / 3.0;



   if (tools) {
		if (grad) {
			if (norm) cc1 = cc1*float3(cmult,cmult,cmult);
			lvls = cc1 * (1.0 - v_in.uv.x);
		} else
		{
			if (mouse.x >= (uv.x - pix3X) && mouse.x <= (uv.x + pix3X)) {lvls = GREEN; orig.a = 1.0;}
			if (mouse.y >= (uv.y - pix3Y) && mouse.y <= (uv.y + pix3Y)) {lvls = GREEN; orig.a = 1.0;}

			if (cdelta < 0.004 && level > 0.0) Black = White;
			if (level < mlevel + 0.005 && level > mlevel - 0.005 && cdelta < 0.004) Black = YELLOW;

			if (uv.x <= CONST_11 + move && uv.x >= CONST_12 + move && uv.y <= CONST_00 && uv.y >= CONST_03) {lvls = Black; orig.a = 1.0;}

			if (uv.x <= CONST_14 + move && uv.x >= CONST_13 + move && uv.y <= CONST_01 && uv.y >= CONST_02) {
				lvls = (1.0 - uv.y <= cc1.r / 2.0 + CONST_02) ? Red : Black;
			}

			if (uv.x <= CONST_15 + move && uv.x >= CONST_14 + move && uv.y <= CONST_01 && uv.y >= CONST_02) {
				lvls = (1.0 - uv.y <= cc1.g / 2.0 + CONST_02) ? Green : Black;
			}

			if (uv.x <= CONST_16 + move && uv.x >= CONST_15 + move && uv.y <= CONST_01 && uv.y >= CONST_02) {
				lvls = (1.0 - uv.y <= cc1.b / 2.0 + CONST_02) ? Blue : Black;
			}

			if (uv.x <= CONST_17 + move && uv.x >= CONST_16 + move && uv.y <= CONST_01 && uv.y >= CONST_02) {
				lvls = (1.0 - uv.y <= level / 2.0 + CONST_02) ? GRAY : Black;
			}

			if (1.0 - uv.y < (mlevel + 0.003) / 2.0 + CONST_02 && 1.0 - uv.y > (mlevel - 0.003) / 2.0 + CONST_02 && uv.x >= CONST_13 + move && uv.x <= CONST_17 + move) lvls = Gray;
		}
}


   return float4(lvls, orig.a);

}

technique Draw
{
    pass
    {
        vertex_shader = VSDefault(v_in);
        pixel_shader  = PassThrough(v_in);
    }
}
]]