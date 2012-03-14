package
{
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
    import flash.utils.Dictionary;

    public class PhysicsData extends Object
	{
		// ptm ratio
        public var ptm_ratio:Number = 2;
		
		// the physcis data 
		var dict:Dictionary;
		
        //
        // bodytype:
        //  b2_staticBody
        //  b2_kinematicBody
        //  b2_dynamicBody

        public function createBody(name:String, world:b2World, bodyType:uint, userData:*):b2Body
        {
            var fixtures:Array = dict[name];

            var body:b2Body;
            var f:Number;

            // prepare body def
            var bodyDef:b2BodyDef = new b2BodyDef();
            bodyDef.type = bodyType;
            bodyDef.userData = userData;

            // create the body
            body = world.CreateBody(bodyDef);

            // prepare fixtures
            for(f=0; f<fixtures.length; f++)
            {
                var fixture:Array = fixtures[f];

                var fixtureDef:b2FixtureDef = new b2FixtureDef();

                fixtureDef.density=fixture[0];
                fixtureDef.friction=fixture[1];
                fixtureDef.restitution=fixture[2];

                fixtureDef.filter.categoryBits = fixture[3];
                fixtureDef.filter.maskBits = fixture[4];
                fixtureDef.filter.groupIndex = fixture[5];
                fixtureDef.isSensor = fixture[6];

                if(fixture[7] == "POLYGON")
                {                    
                    var p:Number;
                    var polygons:Array = fixture[8];
                    for(p=0; p<polygons.length; p++)
                    {
                        var polygonShape:b2PolygonShape = new b2PolygonShape();
                        polygonShape.SetAsArray(polygons[p], polygons[p].length);
                        fixtureDef.shape=polygonShape;

                        body.CreateFixture(fixtureDef);
                    }
                }
                else if(fixture[7] == "CIRCLE")
                {
                    var circleShape:b2CircleShape = new b2CircleShape(fixture[9]);                    
                    circleShape.SetLocalPosition(fixture[8]);
                    fixtureDef.shape=circleShape;
                    body.CreateFixture(fixtureDef);                    
                }                
            }

            return body;
        }

		
        public function PhysicsData(): void
		{
			dict = new Dictionary();
			

			dict["_0000_tupanie_0001"] = [

										[
											// density, friction, restitution
                                            2, 0, 0,
                                            // categoryBits, maskBits, groupIndex, isSensor
											1, 65535, 0, false,
											'POLYGON',

                                            // vertexes of decomposed polygons
                                            [

                                                [   new b2Vec2(44/ptm_ratio, -0.5/ptm_ratio)  ,  new b2Vec2(53.5/ptm_ratio, 12/ptm_ratio)  ,  new b2Vec2(30/ptm_ratio, 24.5/ptm_ratio)  ,  new b2Vec2(12.5/ptm_ratio, 5/ptm_ratio)  ] ,
                                                [   new b2Vec2(54.5/ptm_ratio, 24/ptm_ratio)  ,  new b2Vec2(53.5/ptm_ratio, 12/ptm_ratio)  ,  new b2Vec2(69.5/ptm_ratio, 17/ptm_ratio)  ] ,
                                                [   new b2Vec2(59.5/ptm_ratio, 93/ptm_ratio)  ,  new b2Vec2(67.5/ptm_ratio, 45/ptm_ratio)  ,  new b2Vec2(77.5/ptm_ratio, 93/ptm_ratio)  ,  new b2Vec2(74.5/ptm_ratio, 105/ptm_ratio)  ,  new b2Vec2(63/ptm_ratio, 110.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(35.5/ptm_ratio, 43/ptm_ratio)  ,  new b2Vec2(47.5/ptm_ratio, 38/ptm_ratio)  ,  new b2Vec2(25.5/ptm_ratio, 71/ptm_ratio)  ,  new b2Vec2(18/ptm_ratio, 55.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(53.5/ptm_ratio, 12/ptm_ratio)  ,  new b2Vec2(54.5/ptm_ratio, 24/ptm_ratio)  ,  new b2Vec2(47.5/ptm_ratio, 38/ptm_ratio)  ,  new b2Vec2(35.5/ptm_ratio, 43/ptm_ratio)  ,  new b2Vec2(30/ptm_ratio, 24.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(67/ptm_ratio, 168.5/ptm_ratio)  ,  new b2Vec2(46.5/ptm_ratio, 163/ptm_ratio)  ,  new b2Vec2(63.5/ptm_ratio, 145/ptm_ratio)  ,  new b2Vec2(81/ptm_ratio, 155.5/ptm_ratio)  ,  new b2Vec2(83.5/ptm_ratio, 164/ptm_ratio)  ] ,
                                                [   new b2Vec2(42.5/ptm_ratio, 116/ptm_ratio)  ,  new b2Vec2(56.5/ptm_ratio, 111/ptm_ratio)  ,  new b2Vec2(63.5/ptm_ratio, 145/ptm_ratio)  ,  new b2Vec2(46.5/ptm_ratio, 163/ptm_ratio)  ] ,
                                                [   new b2Vec2(9/ptm_ratio, 168.5/ptm_ratio)  ,  new b2Vec2(-0.5/ptm_ratio, 162/ptm_ratio)  ,  new b2Vec2(42.5/ptm_ratio, 116/ptm_ratio)  ,  new b2Vec2(36/ptm_ratio, 165.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(42.5/ptm_ratio, 116/ptm_ratio)  ,  new b2Vec2(27.5/ptm_ratio, 100/ptm_ratio)  ,  new b2Vec2(25.5/ptm_ratio, 71/ptm_ratio)  ,  new b2Vec2(47.5/ptm_ratio, 38/ptm_ratio)  ,  new b2Vec2(67.5/ptm_ratio, 45/ptm_ratio)  ,  new b2Vec2(56.5/ptm_ratio, 111/ptm_ratio)  ] ,
                                                [   new b2Vec2(6.5/ptm_ratio, 99/ptm_ratio)  ,  new b2Vec2(25.5/ptm_ratio, 71/ptm_ratio)  ,  new b2Vec2(27.5/ptm_ratio, 100/ptm_ratio)  ,  new b2Vec2(11/ptm_ratio, 105.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(42.5/ptm_ratio, 116/ptm_ratio)  ,  new b2Vec2(24.5/ptm_ratio, 135/ptm_ratio)  ,  new b2Vec2(27.5/ptm_ratio, 100/ptm_ratio)  ]
											]

										]

									];

		}
	}
}
