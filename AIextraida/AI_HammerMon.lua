-- AI_HammerMon.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "hammer_mon_wait.frm",
        Func    = "FireGolem_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "FireGolem_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- �ȱ�
            {
                AICheckFrame        = 50,
                AIFunc              = "FireGolem_Check_Walk",
                DelayFrame          = 110,
            },
            -- ��������
            {
                AICheckFrame        = 25,
                AIFunc              = "FireGolem_Check_Attack01",
                DelayFrame          = 30,
            },
            -- ���̾�극��
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_Attack02",
                DelayFrame          = 220,
            },
            -- ��������
            {
                AICheckFrame        = 250,
                AIFunc              = "FireGolem_Check_Attack03",
                DelayFrame          = 220,
            },
            
            -- ��� ����
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_Attack05",
                DelayFrame          = 220,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "hammer_mon_move.frm",
        Func    = "FireGolem_WalkFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "FireGolem_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "FireGolem_Check_TurnToTarget",
                DelayFrame          = 55,
            },
			-- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "FireGolem_Check_Attack01",
                DelayFrame          = 220,
            },
            -- ���̾�극��
            {
                AICheckFrame        = 75,
                AIFunc              = "FireGolem_Check_Attack02",
                DelayFrame          = 220,
            },
            -- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "FireGolem_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "hammer_mon_right_outside_punch.frm",
        Func    = "FireGolem_Attack01Func",
    },
    
    -- �Ʒ� ġ��
    {
        ID      = "ATTACK02",
        Motion  = "hammer_mon_rocket_punch.frm",
        Func    = "FireGolem_Attack02Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK03",
        Motion  = "hammer_mon_earthquake_attack.frm",
        Func    = "FireGolem_Attack03Func",
    },
    
    -- �������� 
    {
        ID      = "ATTACK04",
        Motion  = "hammer_mon_right_punch.frm",
        Func    = "FireGolem_Attack04Func",
    },
    -- ��ġ��
    {
        ID      = "ATTACK05",
        Motion  = "hammer_mon_rocket_upper_punch.frm",
        Func    = "FireGolem_Attack05Func",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "hammer_mon_die.frm",
        Func    = "FireGolem_DieFunc",
    },
}

CallBack =
{
    Land    = "OnFireGolem_Land",
    Die     = "OnFireGolem_Die",
    Damage  = "OnFireGolem_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitHammerMon( iMonsterIndex )
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
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function FireGolem_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame == 135 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )
    end
    
    
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �ȱ� ����
function FireGolem_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    
    if( iFrame == 39 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )
    end
    
    
    if( iFrame >= pMonster:GetLastFrame() ) then
	
        pMonster:SetState( "WALK" )
    end
end

-- �״»���
function FireGolem_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 )then
		pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 20 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

-- ������ ������
function FireGolem_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function FireGolem_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 30 ) then
        pMonster:SkillReadyEffectNoStop( 0, 0, 0, 0.0 )
    elseif( iFrame == 52 ) then
		pMonster:PlaySound( "244" )
		pMonster:StartAttack( 9 ,PAR_DOWN, 0.1, 22, 23, 4 )
	elseif( iFrame == 65 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )    
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ����
function FireGolem_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 111 ) then
        pMonster:PlaySound( "341" )
		pMonster:StartAttack( 9 ,PAR_DOWN, 0.05, 22, 23, 7 )
		pMonster:StartAttack( 9 ,PAR_DOWN, 0.05, 13, 14, 7 )
	elseif( iFrame == 155 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )    
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function FireGolem_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 45 ) then
        pMonster:StartText( "JUMP" )
    elseif( iFrame == 91 ) then
		pMonster:SkillReadyEffect( 0, 0, 0, 0.0 )
    elseif( iFrame == 125 ) then
		pMonster:EarthQuake( 38, 0.06, 0.025 )
		
	elseif( iFrame == 175 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )    
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  �������� ����
function FireGolem_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 56 ) then
		pMonster:PlaySound( "343" )
		pMonster:StartAttack( 9 ,PAR_DOWN, 0.1, 22, 23, 3 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end



-- ����
function FireGolem_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 47 ) then
        pMonster:PlaySound( "343" )
		pMonster:StartAttack( 9 ,PAR_FRONTDOWN_DROPDAMAGE_1, 0.1, 22, 23, 8 )		
	elseif( iFrame == 61 and not pMonster:GetIsRight() ) then
        pMonster:AddTraceParticleOffset( "Hammer_breath" , -0.1 , 0.4 )
    
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function FireGolem_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function FireGolem_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function FireGolem_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function FireGolem_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function FireGolem_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -120, 50, 120, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -100, 0, 100, -350 ) == true or
        pMonster:CheckTargetInRange( -200, -100, 0, 100, -380 ) == true ) then		
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function FireGolem_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:SetState( "ATTACK03" )
	pMonster:ResetDelay()

end


function FireGolem_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 250, -150, 350, 150, 100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnFireGolem_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
end

function OnFireGolem_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnFireGolem_Damage( iMonsterIndex )
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
