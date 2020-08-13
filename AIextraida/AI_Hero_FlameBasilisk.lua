-- AI_Basilisk.lua

ActionList =
{

    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Basilisk_Wait.frm",
        Func    = "Basilisk_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 1,--55,
                AIFunc              = "Basilisk_Check_Targeting",
                DelayFrame          = 1,--110,
            },
            -- 드래곤브레스01
            {
                AICheckFrame        = 55,
                AIFunc              = "Basilisk_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 드래곤브레스02(대각선 아래)
            {
                AICheckFrame        = 55,
                AIFunc              = "Basilisk_Check_Attack02",
                DelayFrame          = 110,
            },
			-- 드래곤브레스03
            {
                AICheckFrame        = 55,
                AIFunc              = "Basilisk_Check_Attack03",
                DelayFrame          = 110,

			},
			-- 드래곤브레스(가로로)
            {
                AICheckFrame        = 55,
                AIFunc              = "Basilisk_Check_Attack05",
                DelayFrame          = 110,
			},
            -- 지진공격
            {
                AICheckFrame        = 220,
                AIFunc              = "Basilisk_Check_Attack03",
                DelayFrame          = 330,
            },
            -- 삼키기
            {
                AICheckFrame        = 55,
                AIFunc              = "Basilisk_Check_Attack04",
                DelayFrame          = 55,
            },
            
            -- 밀어내기 돌풍
            {
                AICheckFrame        = 55,
                AIFunc              = "Basilisk_Check_Attack06",
                DelayFrame          = 55,
            },
        },
    },
    
    -- 드래곤브레스01
    {
        ID      = "ATTACK01",
        Motion  = "Basilisk_Attack01.frm",
        Func    = "Basilisk_Attack01Func",
    },
    
    -- 드래곤브레스02
    {
        ID      = "ATTACK02",
        Motion  = "Basilisk_Attack02.frm",
        Func    = "Basilisk_Attack02Func",
    },
    
    -- 어스퀘이크
    {
        ID      = "ATTACK03",
        Motion  = "Basilisk_Attack03.frm",
        Func    = "Basilisk_Attack03Func",
    },
    
    -- 삼키기
    {
        ID      = "ATTACK04",
        Motion  = "Basilisk_Attack04.frm",
        Func    = "Basilisk_Attack04Func",
    },
    
    -- 드래곤브레스03 (가로로 뿌리기)
    {
        ID      = "ATTACK05",
        Motion  = "Basilisk_Attack05.frm",
        Func    = "Basilisk_Attack05Func",
    },
    
    -- 밀어내기 돌풍
    {
        ID      = "ATTACK06",
        Motion  = "basilisk_hero_attack01.frm",
        Func    = "Basilisk_Attack06Func",
    },
    
    -- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "Basilisk_Damage.frm",
        Func    = "Basilisk_DamageFunc",
    },
    
    -- 다운
    {
        ID      = "DOWN",
        Motion  = "Basilisk_Down.frm",
        Func    = "Basilisk_DownFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 220,
				AICheckFrame1       = 170,
				AICheckFrame2       = 170,
                AIFunc              = "Basilisk_CheckStandup",
                DelayFrame          = 1,
            },
        }
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Basilisk_Die.frm",
        Func    = "Basilisk_DieFunc",
    },
    
    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "Basilisk_StandUp.frm",
        Func    = "Basilisk_StandUpFunc",
    },
}

CallBack =
{
    Land    = "",
    Die     = "OnBasilisk_Die",
    Damage  = "OnBasilisk_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------
BasiliskDown = {};
function InitFlameBasilisk( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    	
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "DAMAGE" )
    
    pMonster:SetIsRight( true )
    pMonster:SetFly( true )
    pMonster:SetX( 5.8 )
    pMonster:SetY( 1.8 )
    pMonster:SetCountValue( 2 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Basilisk_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    pMonster:SetX( 5.8 )
    pMonster:SetY( 1.8 )
		pMonster:SetNoCheckContact( 550 )	
		pMonster:PlaySound( 153 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  드래곤브레스01 상태
function Basilisk_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:PlaySound( 154 )
	elseif( iFrame == 65 or iFrame == 70 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_BASILISK01_01, -1.3, -0.1 )
		pMonster:AddDamageWithLocate( DT_MONSTER_BASILISK01_02, -1.3, -0.1 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  드래곤브레스02 상태
function Basilisk_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:PlaySound( 154 )
    elseif( iFrame >= 55 and iFrame < 81 ) then
		if( math.mod( iFrame, 4 ) == 0 ) then
			pMonster:AddDamageWithLocate( DT_MONSTER_BASILISK02_01, -0.78, -0.07 )
			pMonster:AddDamageWithLocate( DT_MONSTER_BASILISK02_02, -0.78, -0.07 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  어스퀘이크
function Basilisk_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
		pMonster:StartText( "JUMP" )
        pMonster:PlaySound( 155 )
    elseif( iFrame == 56 ) then
		local posx = -0.6
		local posy = -0.5
		pMonster:AddParticle("Power_Shovel_Arm_01", posx, posy)
		pMonster:AddParticle("Power_Shovel_Arm_02", posx, posy)
		pMonster:AddParticle("Power_Shovel_Arm_03", posx, posy)
		pMonster:EarthQuake( 30, 0.06, 0.03 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  깨물기
function Basilisk_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:PlaySound( 155 )
    elseif( iFrame == 2 ) then
		pMonster:PlaySound(987026)
    elseif( iFrame == 43 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_BASILISK04, -0.3, -0.4 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  드래곤브레스03 상태
function Basilisk_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:PlaySound( 154 )
    elseif( iFrame >= 81 and iFrame < 101 ) then
		if( math.mod( iFrame, 4 ) == 0 ) then
			pMonster:AddDamageWithLocate( DT_MONSTER_BASILISK03_01, -0.80, -0.34 )
			pMonster:AddDamageWithLocate( DT_MONSTER_BASILISK03_02, -0.80, -0.42 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  드래곤브레스03 상태
function Basilisk_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:PlaySound( 155 )
    elseif( iFrame == 30 ) then
		pMonster:AddDamageWithLocateDirect(DT_HERO_BASILISK_PUSHPUSHBABY, 0.0, 0.0, false )
		local posx = -0.5
		local posy = -0.52
		pMonster:AddParticleNoDirection("FlameBasil_Windy_01", posx, posy )
		pMonster:AddParticleNoDirection("FlameBasil_Windy_02", posx, posy )
		pMonster:AddParticleNoDirection("FlameBasil_Windy_03", posx, posy )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 데미지상태
function Basilisk_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다운상태
function Basilisk_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        	pMonster:SetFrameLock( true )
    	end
end

-- 죽기상태
function Basilisk_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound( 156 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 일어나기상태
function Basilisk_StandUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK05" )
    end
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Basilisk_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( -300, -2000, 600, 1000, -1000 ) == true ) then
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
        pMonster:ResetDelay()
    end
end

function Basilisk_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( -100, -1200, 800, 1200, -800 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Basilisk_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( -300, -300, 0, 300, -600 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Basilisk_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Basilisk_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( -200, -250, 350, 250, -500 ) == true or pMonster:CheckTargetInRange( -150, -150, 100, 150, -350 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Basilisk_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end

function Basilisk_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( -200, -250, -350, 250, -500 ) == true or pMonster:CheckTargetInRange( -150, -150, -100, 150, -350 ) == true ) then
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end

function Basilisk_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetState( "STANDUP" )
    pMonster:SetCountValue( pMonster:GetCountValue() - 1 )
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnBasilisk_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckState( "DOWN" ) == false ) then
		pMonster:SetState( "DIE" )
	else
		pMonster:SetState( "DIE" )
	end	
end

function OnBasilisk_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetIsRight( true )
	pMonster:SetNoCheckContact( 550 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	
	if( ( pMonster:GetCountValue() == 2) and ( pMonster:GetHP() < 0.7*pMonster:GetMaxHP() ) ) then
		pMonster:SetDownDelay( 360 )
		pMonster:SetState( "DOWN" )
	elseif( ( pMonster:GetCountValue() == 1) and ( pMonster:GetHP() < 0.4*pMonster:GetMaxHP() ) ) then
		pMonster:SetDownDelay( 360 )
		pMonster:SetState( "DOWN" )
	end
	
	if( pMonster:CheckState( "DOWN" ) == false ) then
		if( pMonster:FloatRand() < 0.04 ) then    
			pMonster:SetState( "ATTACK06" )	
            pMonster:SetSuperArmor(true)
        elseif( pMonster:FloatRand() < 0.04 ) then    
            pMonster:SetState( "ATTACK03" )	
            pMonster:SetSuperArmor(true)
		end
	end
end
