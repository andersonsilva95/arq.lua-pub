-- AI_Cyclops.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Cyclops_Wait.frm",
        Func    = "Cyclops_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Cyclops_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 75,
                AIFunc              = "Cyclops_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- �ȱ�
            {
                AICheckFrame        = 110,
                AIFunc              = "Cyclops_Check_Walk",
                DelayFrame          = 110,
            },
            -- ��������
            {
                AICheckFrame        = 25,
                AIFunc              = "Cyclops_Check_Attack01",
                DelayFrame          = 55,
            },			
            -- ���������� ����
            {
                AICheckFrame        = 55,
                AIFunc              = "Cyclops_Check_Attack03",
                DelayFrame          = 110,
            },
            -- �����ġ��
            {
                AICheckFrame        = 75,
                AIFunc              = "Cyclops_Check_Attack02",
                DelayFrame          = 110,
            }, 
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "Cyclops_Check_Attack04",
                DelayFrame          = 165,
            },
            -- õ���Ŀ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Cyclops_Check_SpecialAttack",
                DelayFrame          = 550,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Cyclops_Walk.frm",
        Func    = "Cyclops_WalkFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Cyclops_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Cyclops_Check_TurnToTarget",
                DelayFrame          = 55,
            },
			-- ��������
            {
                AICheckFrame        = 15,
                AIFunc              = "Cyclops_Check_Attack01",
                DelayFrame          = 55,
            },
            -- �����ġ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Cyclops_Check_Attack02",
                DelayFrame          = 110,
            },
            -- ���������� ����
            {
                AICheckFrame        = 75,
                AIFunc              = "Cyclops_Check_Attack03",
                DelayFrame          = 110,
            },
            -- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "Cyclops_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "Cyclops_Attack01.frm",
        Func    = "Cyclops_Attack01Func",
    },
    
    -- �Ŀ�����(�����ġ��)
    {
        ID      = "ATTACK02",
        Motion  = "Cyclops_Attack02.frm",
        Func    = "Cyclops_Attack02Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK03",
        Motion  = "Cyclops_Attack03.frm",
        Func    = "Cyclops_Attack03Func",
    },
        
    -- �����
    {
        ID      = "ATTACK04",
        Motion  = "Cyclops_Attack04.frm",
        Func    = "Cyclops_Attack04Func",
    },
    
    -- õ���Ŀ�
    {
        ID      = "SPECIALATTACK",
        Motion  = "Cyclops_SpecialAttack.frm",
        Func    = "Cyclops_SpecialAttackFunc",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Cyclops_Die.frm",
        Func    = "Cyclops_DieFunc",
    },
}

CallBack =
{
    Land    = "OnCyclops_Land",
    Die     = "OnCyclops_Die",
    Damage  = "OnCyclops_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitCyclops( iMonsterIndex )
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
function Cyclops_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �ȱ� ����
function Cyclops_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �״»���
function Cyclops_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

-- ������ ������
function Cyclops_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Cyclops_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 61 ) then
		pMonster:PlaySound( "244" )
		pMonster:AddDamage( DT_CYCLOPSE_PUNCH )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �Ŀ�����(�����ġ��) ����
function Cyclops_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= 66 and iFrame < 160  ) then
		if( math.mod(iFrame, 10) == 0 ) then
			if( pMonster:GetIsRight() ) then
				pMonster:AddParticle( "cyclops_dash_R", 0.3, 0.5 )
			else
				pMonster:AddParticle( "cyclops_dash", 0.3, 0.5 )
			end
			pMonster:AddParticle( "Frillzard_Dash_Big", 0.0, 0.0 )
			pMonster:AddParticle( "Cyclops_BCrash", 0.0, 0.0 )

			pMonster:AddDamage( DT_CYCLOPSE_CHARGE )
		end
	end
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 61 ) then
        pMonster:SkillReadyEffectNoStop( 0, 0, 0, 0.0 )
    elseif( iFrame >= 64 and iFrame < 171 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
    end
end

--  �������� ����
function Cyclops_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 31 ) then
        pMonster:SkillReadyEffectNoStop( 0, 0, 0, 0.0 )
    elseif( iFrame == 66 ) then
		pMonster:AddDamage( DT_CYCLOPSE_STONE )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �����(��������) ����
function Cyclops_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:StartText("JUMP")
    elseif( iFrame == 41 ) then
        --pMonster:SkillReadyEffectNoStop( 0, 0, 0, 0.0 )
    elseif( iFrame == 78 ) then
		local posx = 0.65
		local posy = 0.0
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
		end
		pMonster:AddParticleNoDirection("Cyclops_Clash", posx, posy)
		pMonster:AddParticleNoDirection("Power_Shovel_Arm_01", posx, posy)
		pMonster:AddParticleNoDirection("Power_Shovel_Arm_02", posx, posy)
		pMonster:AddParticleNoDirection("Power_Shovel_Arm_03", posx, posy)
		pMonster:AddParticleNoDirection("Power_Shovel_Arm_04", posx, posy)
		pMonster:EarthQuake( 30, 0.06, 0.04 )
	elseif( iFrame == 80 ) then
		pMonster:PlaySound( "47" )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  õ���Ŀ� ����
function Cyclops_SpecialAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:StartText("DANGER")
        pMonster:PlaySound( "129" )
    elseif( iFrame == 128 ) then
		local posx = 0.65
		local posy = 0.0
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
		end
		pMonster:AddParticleNoDirection("Cyclops_Clash", posx, posy)
		pMonster:AddParticleNoDirection("Power_Shovel_Arm_01", posx, posy)
		pMonster:AddParticleNoDirection("Power_Shovel_Arm_02", posx, posy)
		pMonster:AddParticleNoDirection("Power_Shovel_Arm_03", posx, posy)
		pMonster:AddParticleNoDirection("Power_Shovel_Arm_04", posx, posy)
		pMonster:EarthQuake( 30, 0.06, 0.04 )
	elseif( iFrame == 130 ) then
		pMonster:PlaySound( "47" )
	elseif( iFrame == 145 ) then
		pMonster:AddDamageWithLocate( DT_RONAN_MAGIC_SPECIAL2_READY,1.00, 0.8 ,true )
		pMonster:AddDamageWithLocate( DT_RONAN_MAGIC_SPECIAL2_READY,3.40, 1.81 ,true )
		pMonster:AddDamageWithLocate( DT_RONAN_MAGIC_SPECIAL2_READY,5.00, 0.8 ,true )
	elseif( iFrame == 165 ) then
		pMonster:AddDamageWithLocate( DT_RONAN_MAGIC_SPECIAL2_READY,0.20, 1.2 ,true )
		pMonster:AddDamageWithLocate( DT_RONAN_MAGIC_SPECIAL2_READY,1.80, 1.81,true)
		pMonster:AddDamageWithLocate( DT_RONAN_MAGIC_SPECIAL2_READY,4.20, 1.81,true)
	elseif( iFrame == 195 ) then
		pMonster:AddDamageWithLocate( DT_RONAN_MAGIC_SPECIAL2_READY,2.60, 1.81,true )
		pMonster:AddDamageWithLocate( DT_RONAN_MAGIC_SPECIAL2_READY,5.80, 1.2,true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Cyclops_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Cyclops_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Cyclops_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Cyclops_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Cyclops_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 200, 150, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Cyclops_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 100, -100, 1000, 100, -300 ) == false ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Cyclops_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 500, -300, 200, 300, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Cyclops_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Cyclops_Check_SpecialAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetTargetY() > 1.1 or pMonster:GetCountValue() >= 10 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "SPECIALATTACK" )
		pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnCyclops_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
end

function OnCyclops_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnCyclops_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	    
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false )
	
	if ( pMonster:FloatRand() < 0.2 and pMonster:IsSuperArmor() == false ) then	
		if ( pMonster:FloatRand() < 0.4 ) then
			pMonster:SetState( "ATTACK03" )	
		else
			pMonster:SetState( "ATTACK04" )	
		end
		pMonster:TurnToTarget()
        pMonster:SetSuperArmor(true)
	end
end
