-- AI_Kakiru.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Kakiru_Wait.frm",
        Func    = "Kakiru_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Kakiru_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 75,
                AIFunc              = "Kakiru_Check_TurnToTarget",
                DelayFrame          = 75,
            },--[[
            -- 근접공격
            {
                AICheckFrame        = 55,
                AIFunc              = "Kakiru_Check_Attack01",
                DelayFrame          = 220,
            },
            -- 포효
            {
                AICheckFrame        = 110,
                AIFunc              = "Kakiru_Check_Attack02",
                DelayFrame          = 1100,
            },
            -- 땅찍기
            {
                AICheckFrame        = 110,
                AIFunc              = "Kakiru_Check_Attack03",
                DelayFrame          = 220,
            },
            -- 휠윈드
            {
                AICheckFrame        = 75,
                AIFunc              = "Kakiru_Check_Attack04",
                DelayFrame          = 220,
            },
            -- 밥상뒤업기
            {
                AICheckFrame        = 75,
                AIFunc              = "Kakiru_Check_Attack05",
                DelayFrame          = 330,
            },
            
            -- 천지파열
            {
                AICheckFrame        = 110,
                AIFunc              = "Kakiru_Check_Attack06",
                DelayFrame          = 880,
            },--]]
        },
    },

    -- 이동
    {
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Kakiru_Attack01.frm",
        Func    = "Kakiru_Attack01Func",
    },
    
    -- 포효
    {
        ID      = "ATTACK02",
        Motion  = "Kakiru_Attack02.frm",
        Func    = "Kakiru_Attack02Func",
    },
    
    -- 땅찍기
    {
        ID      = "ATTACK03",
        Motion  = "Kakiru_Attack03.frm",
        Func    = "Kakiru_Attack03Func",
    },
        
    -- 휠윈드
    {
        ID      = "ATTACK04",
        Motion  = "Kakiru_Attack04.frm",
        Func    = "Kakiru_Attack04Func",
    },
    
    -- 밥상뒤업기
    {
        ID      = "ATTACK05",
        Motion  = "Kakiru_Attack05.frm",
        Func    = "Kakiru_Attack05Func",
    },
    
    -- 천지파열
    {
        ID      = "ATTACK06",
        Motion  = "Kakiru_Attack06.frm",
        Func    = "Kakiru_Attack06Func",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Kakiru_Die.frm",
        Func    = "Kakiru_DieFunc",
    },
}

CallBack =
{
    Land    = "OnKakiru_Land",
    Die     = "OnKakiru_Die",
    Damage  = "OnKakiru_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitKakiru( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
--[[
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
--]]
	pMonster:SetY( 0.23 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Kakiru_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function Kakiru_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    
    if( iFrame == 81 ) then
		pMonster:PlaySound( "golem_walkwave" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:PlaySound( "golem_walkwave" )
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function Kakiru_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

-- 데미지 입은거
function Kakiru_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Kakiru_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 41 ) then
		pMonster:PlaySound( "244" )
		pMonster:AddDamage( DT_STONE_GOLEM_PUNCH )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 포효
function Kakiru_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 61 ) then
		pMonster:PlaySound( "golem_shout" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetState( "WAIT" )
    end
end

--  땅찍기 상태
function Kakiru_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 51 ) then
		pMonster:EarthQuake( 25, 0.06, 0.01 )
	elseif( iFrame == 54 ) then
		pMonster:PlaySound( "47" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  휠윈드
function Kakiru_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 86 ) then
		pMonster:AddDamage( DT_STONE_GOLEM_WHIRL_WIND )
		pMonster:AddDamage( DT_STONE_GOLEM_TORNADO1 )
		pMonster:AddDamage( DT_STONE_GOLEM_TORNADO2 )
		pMonster:AddDamage( DT_STONE_GOLEM_TORNADO3 )
	elseif( iFrame > 86 and iFrame < 161) then
		if( math.mod( (iFrame - 7) , 20 ) == 0 ) then
			pMonster:PlaySound( "244" )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  밥상뒤업기
function Kakiru_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame > 46 and iFrame < 91 ) then
		if( iFrame == 51 ) then
			pMonster:PlaySound( "golem_earthquake" )
		elseif( iFrame == 56 ) then
			pMonster:AddDamageWithLocate( DT_STONE_GOLEM_BABSANG, 0.6, 0.0 )
			pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT01", 0.6, -0.1 )
			pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT02", 0.6, -0.1 )
		elseif( iFrame == 61 ) then
			pMonster:PlaySound( "golem_earthquake" )
		elseif( iFrame == 66 ) then
			pMonster:AddDamageWithLocate( DT_STONE_GOLEM_BABSANG, 1.1, 0.0 )
			pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT01", 1.1, -0.1 )
			pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT02", 1.1, -0.1 )
		elseif( iFrame == 71 ) then
			pMonster:PlaySound( "golem_earthquake" )
		elseif( iFrame == 76 ) then
			pMonster:AddDamageWithLocate( DT_STONE_GOLEM_BABSANG, 1.6, 0.0 )
			pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT01", 1.6, -0.1 )
			pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT02", 1.6, -0.1 )
		elseif( iFrame == 81 ) then
			pMonster:PlaySound( "golem_earthquake" )
		elseif( iFrame == 86 ) then
			pMonster:AddDamageWithLocate( DT_STONE_GOLEM_BABSANG, 2.1, 0.0 )
			pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT01", 2.1, -0.1 )
			pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT02", 2.1, -0.1 )
			
		end		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  천지파열 상태
function Kakiru_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 91 ) then
		pMonster:EarthQuake( 25, 0.06, 0.006 )
	elseif( iFrame == 94 ) then
		pMonster:PlaySound( "47" )
	elseif( iFrame == 111 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 0.16 - pMonster:GetX(), 3.0 )
	elseif( iFrame == 121 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 2.08 - pMonster:GetX(), 3.0 )
	elseif( iFrame == 131 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 1.76 - pMonster:GetX(), 3.0 )
	elseif( iFrame == 141 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 0.80 - pMonster:GetX(), 3.0 )
	elseif( iFrame == 151 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 1.12 - pMonster:GetX(), 3.0 )
	elseif( iFrame == 161 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 2.40 - pMonster:GetX(), 3.0 )
	elseif( iFrame == 171 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 1.44 - pMonster:GetX(), 3.0 )
	elseif( iFrame == 181 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 0.48 - pMonster:GetX(), 3.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Kakiru_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Kakiru_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Kakiru_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Kakiru_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Kakiru_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 200, 150, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Kakiru_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Kakiru_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Kakiru_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetX() > 0.8 and pMonster:GetX() <= 1.7 and pMonster:CheckTargetInRange( 0, -300, 400, 300, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Kakiru_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetX() > 0.8 and pMonster:GetX() <= 1.7 and pMonster:CheckTargetInRange( 400, -400, 300, 400, -200 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end

function Kakiru_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:GetCountValue() >= 10 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnKakiru_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
end

function OnKakiru_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnKakiru_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
    
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
end
